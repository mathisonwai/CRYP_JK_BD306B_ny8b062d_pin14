
/**
 *   ************************************************************************************
 *
 *                            (ologo Electronic CO.,LTD)
 *   ************************************************************************************
 *   @Project        CRYP_BD306B
 *   @File:              main.c
 *   @Description:
 *               1. FINST = 2MHz/2T(I_HRC)
 *               2. Timer0 overflow interrupt flag bit will be set every 256us
 *               3.
 *   @Author:        mathison.wai
 *   @Version:       v1.0
 *   @Date           2023.09.07
 *
 *       8M2T
 *
 **/

#include <ny8.h>
#include "ny8_constant.h"
#include "app_cfg.h"

#define UPDATE_REG(x) __asm__("MOVR _" #x ",F")

void io_uart_tx(unsigned char sendByte);

volatile unsigned char vFlag_0;
__sbit bFlag_gSysTick_Change = vFlag_0 : 0;
__sbit bFlag_Timeslice_320ms = vFlag_0 : 1;
__sbit bFlag_disable_key_func = vFlag_0 : 2;
__sbit bFlag_light_on = vFlag_0 : 3;
__sbit bFlag_Vin_Plug_In = vFlag_0 : 4;
__sbit bFlag_bat_vol_low = vFlag_0 : 5;
__sbit bFlag_bat_vol_shutdown = vFlag_0 : 6;
__sbit bFlag_blink = vFlag_0 : 7;

// volatile unsigned char vFlag_1;
// __sbit bFlag_headset_plug_in_left = vFlag_1 : 0;  // bFlag_is_High_Temp
// __sbit bFlag_headset_plug_in_right = vFlag_1 : 1; // CC <-- Charge Complete  bFlag_OCP1_CC
// __sbit bFlag_send_0x80cmd = vFlag_1 : 2;          // 关机
// __sbit bFlag_disable_key = vFlag_1 : 3;
// __sbit bFlag_send_0x1bcmd = vFlag_1 : 4;  // bFlagAdNtcUpdate bFlag_Chargering_From_Empty
// __sbit bFlag_send_cmd_left = vFlag_1 : 5; // bFlag_send_left_right_cmd
// __sbit bFlag_lid_is_open = vFlag_1 : 6;   // bFlagAdCurrentChannelLeftUpdate
// __sbit bFlag_send_0x81cmd = vFlag_1 : 7;  // bFlagAdCurrentChannelRightUpdate   //channel right

// volatile unsigned char vFlag_2;
// __sbit bFlagAdVoltageBatteryUpdate = vFlag_2 : 0;
// __sbit bFlag_is_breathing_mode = vFlag_2 : 1;
// __sbit bFlag_inc_or_dec = vFlag_2 : 2;
// __sbit bFlag_Send_Power_Off = vFlag_2 : 3;
// __sbit bFlag_rx_data = vFlag_2 : 4;
// __sbit keyIndex                             = vFlag_2: 5;
// __sbit bFlag_send_cmd_right = vFlag_2 : 6; // bFlag_enable_get_0x1bcmd
// __sbit bFlag_get_dat_ok = vFlag_2 : 7;

volatile unsigned char red_led_blink_cnt;
volatile unsigned char mMotorWorkMode;
volatile unsigned char mMotorWorkMode4Cnt;
volatile unsigned int mMotorWorkDuty;
volatile unsigned int mMotorWorkCycle;
volatile unsigned char yMotorWorkMode;
volatile unsigned char yMotorWorkDuty;
volatile unsigned char yMotorWorkDutyBase;
volatile unsigned char yMotorWorkCycle;
volatile unsigned char yMotorWorkStep;
volatile unsigned char delay_op_m68_timer;
volatile unsigned char timer_slice_10ms;
volatile unsigned char delaySleepTime;
volatile unsigned char gpioKeyWaitTimer; 
GPIO_KEY_STATE gpioKeyState;

#ifdef BREATH_LED_MODE
volatile unsigned char respiration_lamp_timer;
#endif

volatile unsigned char gSysTick;
volatile unsigned int m68Pressure;
volatile unsigned int m68Pressure2;

#if 0
const unsigned char gpioKeyEvent[][5] =
    {
        //! PDS(按键开始)，  SPR(短按松开)，      CPS(长按开始)，     CPH(长按保持)，       CPR(长按松开)
        {MSG_NONE,          MSG_MODE,           MSG_POWER_ON,       KEY_POWER_LONG,     KEY_POWER_LONG_BREAK}, // K1
        {MSG_NONE,          MSG_LIGHT,          MSG_LIGHT_CPS,      MSG_LIGHT_CPH,      MSG_LIGHT_CPR},       // K2
        {MSG_NONE,          MSG_NONE,           MSG_NONE,           MSG_LIGHT_CPH,      MSG_LIGHT_CPR},       // K3
};

const unsigned char gpioKeyEvent[][5] =
    {
        //! PDS(按键开始)，  SPR(短按松开)，      CPS(长按开始)，     CPH(长按保持)，       CPR(长按松开)
        {MSG_NONE,          MSG_M_SPR,          MSG_M_CPS,         MSG_NONE,            MSG_NONE}, // K1
        {MSG_NONE,          MSG_Y_SPR,          MSG_Y_CPS,         MSG_NONE,            MSG_NONE},       // K2
        {MSG_NONE,          MSG_NONE,           MSG_MY_CPS,        MSG_NONE,            MSG_NONE},       // K3
};
#endif

const unsigned char gpioKeyEvent[][5] =
    {
        //! PDS(按键开始)，  SPR(短按松开)，      CPS(长按开始)，     CPH(长按保持)，       CPR(长按松开)
        {MSG_NONE, MSG_M_SPR, MSG_M_CPS, MSG_NONE, MSG_NONE}, // K1
        {MSG_NONE, MSG_Y_SPR, MSG_Y_CPS, MSG_NONE, MSG_NONE}, // K2
        {MSG_NONE, MSG_NONE, MSG_MY_CPS, MSG_NONE, MSG_NONE}, // K3
};

#define io_uart_send_char UART_TDATA

void isr(void) __interrupt(0) // 64us   //! 100us -- 10ms
{
    static unsigned char yTimerCnt;
    static unsigned int mTimerCnt;

    if (TM0IF)
    {
        TM0IF = 0;
        TMR0 = 0x47;               // 125 138;//0x0F;  34.8us
        bFlag_gSysTick_Change = 1; // 128us
        if (yMotorWorkMode)
        {
            yTimerCnt++;
            if (yTimerCnt >= yMotorWorkCycle)
            {
                yTimerCnt = 0;
            }
            if (yTimerCnt < yMotorWorkDuty)
            {
                Y_BDCM_ON;
            }
            else
            {
                Y_BDCM_OFF;
            }
        }
        if (mMotorWorkMode)
        {
            mTimerCnt++;
            if (mTimerCnt >= mMotorWorkCycle)
            {
                mTimerCnt = 0;
                if (4 == mMotorWorkMode)
                {
                    mMotorWorkMode4Cnt++; // 0 1 2 3
                    if (3 == mMotorWorkMode4Cnt)
                    {
                        // 再高1S，低250ms
                        mMotorWorkDuty = 10000;  // 50% --- 200ms = 2000*100us
                        mMotorWorkCycle = 12500; // 对应周期1250ms 12500*100us
                    }
                    if (mMotorWorkMode4Cnt > 3)
                    {
                        mMotorWorkMode4Cnt = 0;
                        mMotorWorkDuty = 2000;  // 50% --- 200ms = 2000*100us
                        mMotorWorkCycle = 4000; // 对应周期400ms 1%=4ms 100%= 10ms
                    }
                }
            }

            if (mTimerCnt < mMotorWorkDuty)
            {
                M_BDCM_ON;
            }
            else
            {
                M_BDCM_OFF;
            }
        }
    }
}

void _dly_us(unsigned char cnt)
{
    while (cnt)
    {
        cnt--;
    }
}

#define CONST_VIN_FILTER (15)
void get_vin_status(void) //! OK
{
    static unsigned char counter;
    P_VIN_INPUT;

    if (bFlag_Vin_Plug_In)
    {
        if (!P_VIN)
        {
            if (++counter > CONST_VIN_FILTER)
            {
                bFlag_Vin_Plug_In = 0;
            }
        }
        else
        {
            counter = 0;
        }
    }
    else
    {
        if (P_VIN)
        {
            if (++counter > CONST_VIN_FILTER)
            {
                bFlag_Vin_Plug_In = 1; //
                bFlag_bat_vol_low = 0;
                bFlag_bat_vol_shutdown = 0;
                PCON1 &= 0xE3;          // 111 0 00 11
                PCON1 |= (BIT4 | BIT3); // LVDS[2:0] 110 --3.6V
                yMotorWorkMode = 0;
                yMotorWorkDuty = 0;    // 0/200 = 0%
                yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
                Y_BDCM_OFF;
                M68_POWER_OFF;
                mMotorWorkMode = 0;
                mMotorWorkDuty = 0;    // 0% = 0*100us = 0ms
                mMotorWorkCycle = 100; // 对应周期10ms 1%=100us 100%= 10ms
                M_BDCM_OFF;
                bFlag_bat_vol_shutdown = 0;
            }
        }
        else
        {
            counter = 0;
        }
    }
}

void get_bat_vol(void) //! OK
{
    static unsigned char counter;

    if (0 == bFlag_bat_vol_low)
    {
        if (0 == (PCON1 & BIT6)) //
        {
            if (++counter > CONST_VIN_FILTER)
            {
                bFlag_bat_vol_low = 1; //
                if (red_led_blink_cnt < 12)
                {
                    red_led_blink_cnt = 12;
                }
                bFlag_light_on = 0;
                PCON1 &= 0xE3;          // 111 0 00 11
                PCON1 |= (BIT4 | BIT2); // LVDS[2:0] 101 --3.3V
            }
        }
        else
        {
            counter = 0;
        }
    }
    else if (0 == bFlag_bat_vol_shutdown)
    {
        if (0 == (PCON1 & BIT6))
        {
            if (++counter > CONST_VIN_FILTER)
            {
                io_uart_tx(0x44);
                bFlag_bat_vol_shutdown = 1; //
                red_led_blink_cnt = 90;
                bFlag_light_on = 0;
            }
        }
        else
        {
            counter = 0;
        }
    }
}

KEY_EVENT gpioKeyScan(void)
{
    static unsigned char prekeyIndex = 0xFF;
    unsigned char keyIndex;
    if (gpioKeyWaitTimer)
    {
        gpioKeyWaitTimer--;
    }

    keyIndex = 0xFF;
    if (bFlag_Vin_Plug_In)
    {
        gpioKeyState = GPIO_KEY_STATE_IDLE;
        return MSG_NONE;
    }

    if ((0 == P_KEY_M) && (0 == P_KEY_Y))
    {
        keyIndex = 2;
    }

    else if (0 == P_KEY_M)
    {
        keyIndex = 0;
    }
    else if (0 == P_KEY_Y)
    {
        keyIndex = 1;
    }

    switch (gpioKeyState)
    {
    case GPIO_KEY_STATE_IDLE:
        if (0xFF == keyIndex)
        {
            return MSG_NONE;
        }

        prekeyIndex = keyIndex;
        gpioKeyWaitTimer = GPIO_KEY_JTTER_TIME;
        // DBG(("GOTO JITTER!\n"));
        io_uart_tx(0x51);
        gpioKeyState = GPIO_KEY_STATE_JITTER;

    case GPIO_KEY_STATE_JITTER:
        if (prekeyIndex != keyIndex)
        {
            // DBG(("GOTO IDLE Because jitter!\n"));
            io_uart_tx(0x50);
            gpioKeyState = GPIO_KEY_STATE_IDLE;
        }
        else if (!gpioKeyWaitTimer)
        {
            // DBG(("GOTO PRESS_DOWN!\n"));
            io_uart_tx(0x52);
            gpioKeyWaitTimer = GPIO_KEY_CP_TIME;
            gpioKeyState = GPIO_KEY_STATE_PRESS_DOWN;
            return gpioKeyEvent[prekeyIndex][0]; //! PDS(按键开始)
        }

        break;

    case GPIO_KEY_STATE_PRESS_DOWN:
        if (prekeyIndex != keyIndex)
        {
            // DBG(("ADC KEY SP!*****\n"));
            io_uart_tx(0x53);
            gpioKeyState = GPIO_KEY_STATE_IDLE;
            return gpioKeyEvent[prekeyIndex][1]; //! SPR(短按松开)
        }

        else if (!gpioKeyWaitTimer)
        {
            // DBG(("ADC KEY CP!********\n"));
            io_uart_tx(0x54);
            gpioKeyWaitTimer = GPIO_KEY_CPH_TIME;
            gpioKeyState = GPIO_KEY_STATE_CP;
            return gpioKeyEvent[prekeyIndex][2]; //! CPS(长按开始)
        }

        break;

    case GPIO_KEY_STATE_CP:
        if (prekeyIndex != keyIndex)
        {
            // DBG(("ADC KEY CPR!*************\n"));// UARTSendDataByte(0xA4);
            io_uart_tx(0x55);
            gpioKeyState = GPIO_KEY_STATE_IDLE;
            return gpioKeyEvent[prekeyIndex][4]; //! CPR(长按松开)
        }

        else if (!gpioKeyWaitTimer)
        {
            // DBG(("ADC KEY CPH!*************\n"));
            io_uart_tx(0x56);
            gpioKeyWaitTimer = GPIO_KEY_CPH_TIME;
            return gpioKeyEvent[prekeyIndex][3]; //! CPH (长按保持)
        }

        break;

    default:
        // io_uart_tx(0x57);
        gpioKeyState = GPIO_KEY_STATE_IDLE;
        break;
    }

    return MSG_NONE;
}

// 长按K1（1.5S）开启M1（振动马达），并以第1模式开始振动；
// 此时短按K1切换马达模式（1-2-3-4-1……，每短按K1一次切换一种模式）；再次长按1.5S关闭M1

// 长按K2（1.5S）开启M2（吮吸马达），并以第1模式开始转动；
// 此时短按K2切换马达模式（1-2-3-4-5-6-7-1……，每短按K1一次切换一种模式）；再次长按1.5S关闭M2。
void Key_Proc(void)
{

    KEY_EVENT imsg = MSG_NONE;
    imsg = gpioKeyScan();

    switch (imsg)
    {
    case MSG_M_SPR: // 短按K1切换马达模式
        if (0 == bFlag_disable_key_func)
        {
            switch (mMotorWorkMode)
            {
            case 1:
              
                mMotorWorkMode = 2;
                mMotorWorkDuty = 70;   // 70%
                mMotorWorkCycle = 100; // 对应周期10ms 1%=100us 100%= 10ms
                break;
            case 2:
              
                mMotorWorkMode = 3;
                mMotorWorkDuty = 100;  // 100%
                mMotorWorkCycle = 100; // 对应周期10ms 1%=100us 100%= 10ms
                break;
            case 3:
     
                mMotorWorkMode = 4;
                mMotorWorkDuty = 2000;  // 50% --- 200ms = 2000*100us
                mMotorWorkCycle = 4000; // 对应周期400ms 1%=4ms 100%= 10ms
                mMotorWorkMode4Cnt = 0;
                break;
            case 4:

                mMotorWorkMode = 1;
                mMotorWorkDuty = 40;   // 40% = 40*100us = 4ms
                mMotorWorkCycle = 100; // 对应周期10ms 1%=100us 100%= 10ms
                break;
            default:
                break;
            }
        }
        break;

    case MSG_Y_SPR:
        if (0 == bFlag_disable_key_func)
        {
            switch (yMotorWorkMode)
            {
            case 1:
                io_uart_tx(0x72);
                yMotorWorkMode = 2;
                yMotorWorkDuty = 80; // 80/200 = 40%
                yMotorWorkDutyBase = 80;
                yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
                yMotorWorkStep = 12;
                break;
            case 2:
                io_uart_tx(0x73);
                yMotorWorkMode = 3;
                yMotorWorkDuty = 140; // 140/200 = 70%
                yMotorWorkDutyBase = 140;
                yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
                yMotorWorkStep = 6;
                break;
            case 3:
                io_uart_tx(0x74);
                yMotorWorkMode = 4;
                yMotorWorkDuty = 70;   // 70/200 = 35%
                yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
                yMotorWorkStep = 0;
                break;
            case 4:
                io_uart_tx(0x75);
                yMotorWorkMode = 5;
                yMotorWorkDuty = 80;   // 80/200 = 40%
                yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
                yMotorWorkStep = 0;
                break;
            case 5:
                io_uart_tx(0x76);
                yMotorWorkMode = 6;
                yMotorWorkDuty = 90;   // 90/200 = 45%
                yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
                yMotorWorkStep = 0;
                break;
            case 6:
                io_uart_tx(0x77);
                yMotorWorkMode = 7;
                yMotorWorkDuty = 100;  // 100/200 = 50%
                yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
                yMotorWorkStep = 0;
                break;
            case 7:
                io_uart_tx(0x78);
                yMotorWorkMode = 1;
                yMotorWorkDuty = 60; // 60/200 = 30%
                yMotorWorkDutyBase = 60;
                yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
                yMotorWorkStep = 14;
                break;
            default:
                break;
            }
        }
        break;

    case MSG_M_CPS: // K1 长击  长按K1（1.5S）开启M1（振动马达），并以第1模式开始振动；
        if (0 == bFlag_disable_key_func)
        {
            if (mMotorWorkMode)
            {
                io_uart_tx(0x60);
                mMotorWorkMode = 0;
                mMotorWorkDuty = 0;    // 0% = 0*100us = 0ms
                mMotorWorkCycle = 100; // 对应周期10ms 1%=100us 100%= 10ms
                M_BDCM_OFF;
            }
            else
            {
                io_uart_tx(0x6F);
                mMotorWorkMode = 1;
                mMotorWorkDuty = 40;   // 40% = 40*100us = 4ms
                mMotorWorkCycle = 100; // 对应周期10ms 1%=100us 100%= 10ms
            }
        }
        break;

    case MSG_Y_CPS: //  K2 长击
        if (0 == bFlag_disable_key_func)
        {
            if (yMotorWorkMode)
            {
                io_uart_tx(0x70);
                yMotorWorkMode = 0;
                yMotorWorkDuty = 0;    // 0/200 = 0%
                yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
                Y_BDCM_OFF;
                M68_POWER_OFF;
            }
            else
            {
                io_uart_tx(0x7F);
                yMotorWorkMode = 1;
                yMotorWorkDuty = 60; // 60/200 = 30%
                yMotorWorkDutyBase = 60;
                yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
                yMotorWorkStep = 14;
                M68_POWER_ON;
                delay_op_m68_timer = CONST_DLY_OP_M68_TIMER;
            }
        }
        break;

    case MSG_MY_CPS: //  K1K2 同时长击
        if (red_led_blink_cnt < 4)
        {
            red_led_blink_cnt = 4;
        }
        bFlag_light_on = 0;
        if (bFlag_disable_key_func)
        {
            io_uart_tx(0xEE);
            bFlag_disable_key_func = 0;
        }
        else
        {
            io_uart_tx(0xDD);
            bFlag_disable_key_func = 1;
        }
        break;

    default:
        break;
    }
}

//-----------------------------------------------------------------------------------------
//! OK
void i2c_start(void)
{
    P_I2C_SDA_SET;
    P_I2C_SCL_SET;
    P_I2C_SDA_OUTPUT;
    P_I2C_SCL_OUTPUT;
    _dly_us(10);
    P_I2C_SDA_CLR;
    _dly_us(10);
    P_I2C_SCL_CLR;
}

//! OK
void i2c_stop(void)
{
    P_I2C_SCL_CLR;
    P_I2C_SDA_CLR;
    _dly_us(10);
    P_I2C_SCL_SET;
    _dly_us(10);
    P_I2C_SDA_SET;
}

//! ok
unsigned char i2c_chk_ack(void)
{

    P_I2C_SCL_CLR;                                  // slave send ACK
    P_I2C_SDA_INPUT;                                // Allow slave to send ACK
    unsigned char getAckTime = CONST_TIMER_GET_ACK; // 返回ACK信号延时等待时间
    _dly_us(0);
    P_I2C_SCL_SET;
    _dly_us(0);
    while (P_I2C_SDA)
    {
        --getAckTime;

        if (0 == getAckTime)
        {
            return 1;
        }
    }

    P_I2C_SCL_CLR;
    P_I2C_SDA_OUTPUT;
    return 0;
}
//! OK 产生ACK应答
void i2c_send_ack(void)
{
    P_I2C_SCL_CLR;
    P_I2C_SDA_CLR;
    _dly_us(10);
    P_I2C_SCL_SET;
    _dly_us(10);
    P_I2C_SCL_CLR;
    P_I2C_SDA_CLR;
}
//! OK
void i2c_send_nack(void)
{
    P_I2C_SCL_CLR;
    P_I2C_SDA_SET;
    _dly_us(10);
    P_I2C_SCL_SET;
    _dly_us(10);
    P_I2C_SCL_CLR;
    P_I2C_SDA_CLR;
}
//! OK
unsigned char i2c_writeByte(unsigned char sendByte)
{
    unsigned char i = 8;

    while (i--) // I2C_SDA脚从高位至低位发送数据
    {
        P_I2C_SCL_CLR; // 拉低I2C_SCL,以允许I2C_SDA脚w位数据发生变化
        _dly_us(0);
        if (sendByte & 0x80) /* MSB output first */
        {
            P_I2C_SDA_SET;
        }
        else
        {
            P_I2C_SDA_CLR;
        }
        sendByte <<= 1;
        P_I2C_SCL_SET; // 拉高I2C_SCL
        _dly_us(0);
        NOP();
    }

    return i2c_chk_ack();
}
// OK
unsigned char i2c_readByte(void)
{
    unsigned char i = 8;
    unsigned char readByte = 0;

    P_I2C_SCL_CLR;   // 拉低I2C_SCL
    P_I2C_SDA_INPUT; // 设置I2C_SDA为输入

    while (i--)
    {
        // _dly_us(10);
        P_I2C_SCL_SET; // 拉高I2C_SCL
        _dly_us(0);
        readByte <<= 1;

        if (P_I2C_SDA)
        {
            readByte |= 0x01;
        }

        P_I2C_SCL_CLR; // 拉低I2C_SCL
        _dly_us(0);
    }

    // _dly_us(10);
    P_I2C_SDA_OUTPUT; // 设置I2C_SDA为输出
    return readByte;  // 返回数据
}

BOOL ip53xs_writeByte(unsigned char deviceAddr, unsigned char regAddr, unsigned char sendByte)
{
    // if (P_I2C_INT)
    {
        i2c_start();

        if (i2c_writeByte(deviceAddr | IIC_WRITE))
        {
            i2c_stop();
            return FALSE;
        }

        if (i2c_writeByte(regAddr))
        {
            i2c_stop();
            return FALSE;
        }

        if (i2c_writeByte(sendByte))
        {
            i2c_stop();
            return FALSE;
        }

        i2c_stop();
    }

    return TRUE;
}

// unsigned char ip53xs_readByte(unsigned char deviceAddr, unsigned char regAddr) //(unsigned char regAddr)
// {
//     unsigned char readByte;
//     // if (P_I2C_INT)
//     {
//         i2c_start();

//         if (i2c_writeByte(deviceAddr | IIC_WRITE))
//         {
//             i2c_stop();
//             return FALSE;
//         }

//         if (i2c_writeByte(regAddr))
//         {
//             i2c_stop();
//             return FALSE;
//         }

//         i2c_start();

//         if (i2c_writeByte(deviceAddr | IIC_READ))
//         {
//             i2c_stop();
//             return FALSE;
//         }

//         readByte = i2c_readByte();
//         i2c_send_nack();
//         i2c_stop();
//     }

//     return readByte;
// }

void ip53xs_read_nBytes(unsigned char *pBuffer, unsigned char deviceAddr, unsigned char regAddr, unsigned char nbytes) //(unsigned char regAddr)
{
    unsigned char itmp;

    i2c_start();

    if (i2c_writeByte(deviceAddr | IIC_WRITE))
    {
        goto ip53xs_read_nBytes_End;
    }

    if (i2c_writeByte(regAddr))
    {
        goto ip53xs_read_nBytes_End;
    }

    i2c_start();

    if (i2c_writeByte(deviceAddr | IIC_READ))
    {
        goto ip53xs_read_nBytes_End;
    }

    for (itmp = 0; itmp < (nbytes - 1); itmp++) // 连续接收
    {
        *pBuffer = i2c_readByte();
        pBuffer++;
        i2c_send_ack();
    }

    *pBuffer = i2c_readByte();
    i2c_send_nack();
ip53xs_read_nBytes_End:

    i2c_stop();
}

//-------------------------------------------------------------------------------------
// 从机地址：0xE4
// 读取压力信息
// 通过访问静态寄存器 0x21 获得，共 4 字节。每 2 字节按低字节在前，高字节在后拼接
// （以下未说明部分皆为低字节在前，高字节在后拼接方式），分别得到通道一和通道二的压
// 力。
// 下列为读取数据拼接实例
// Byte[0]：0x2C Byte[1]：0x01
// Byte[2]：0xE8 Byte[3]：0x03
// 通道一按压力度：0x012C(300g), 通道二按压力度：0x00C8(200g).
// void get_m68_pressure(void)
// {
//     unsigned char reg_m68;
//     unsigned int itmp_16bits;
//     io_uart_tx(0xAA);
//     io_uart_tx(0xAA);
//     reg_m68 = ip53xs_readByte(0xE4, 0x22);
//     itmp_16bits = reg_m68;
//     itmp_16bits <<= 8;
//     reg_m68 = ip53xs_readByte(0xE4, 0x21);
//     itmp_16bits |= reg_m68;
//     m68Pressure = itmp_16bits;
//     io_uart_tx((unsigned char)(m68Pressure >> 8));
//     io_uart_tx((unsigned char)(m68Pressure));
//     io_uart_tx(0xBB);
//     io_uart_tx(0xBB);
//     reg_m68 = ip53xs_readByte(0xE4, 0x24);
//     itmp_16bits = reg_m68;
//     itmp_16bits <<= 8;
//     reg_m68 = ip53xs_readByte(0xE4, 0x23);
//     itmp_16bits |= reg_m68;
//     m68Pressure2 = itmp_16bits;
//     io_uart_tx((unsigned char)(m68Pressure2 >> 8));
//     io_uart_tx((unsigned char)(m68Pressure2));
//     io_uart_tx(0xCC);
//     io_uart_tx(0xCC);
// }

void get_m68_pressure_nbytes(void)
{
    unsigned char reg_buffer[4];
    unsigned int itmp_16bits;
    reg_buffer[0] = 0;
    reg_buffer[1] = 0;
    reg_buffer[2] = 0;
    reg_buffer[3] = 0;
    ip53xs_read_nBytes(&reg_buffer[0], 0xE4, 0x21, 4);
    io_uart_tx(0xAA);
    io_uart_tx(0xAA);
    io_uart_tx((unsigned char)(reg_buffer[1]));
    io_uart_tx((unsigned char)(reg_buffer[0]));
    itmp_16bits = reg_buffer[1];
    itmp_16bits <<= 8;
    itmp_16bits |= reg_buffer[0];
    m68Pressure = itmp_16bits;
    io_uart_tx(0xBB);
    io_uart_tx(0xBB);

    io_uart_tx((unsigned char)(reg_buffer[3]));
    io_uart_tx((unsigned char)(reg_buffer[2]));
    itmp_16bits = reg_buffer[3];
    itmp_16bits <<= 8;
    itmp_16bits |= reg_buffer[2];
    m68Pressure2 = itmp_16bits;
    io_uart_tx(0xCC);
    io_uart_tx(0xCC);
}
// mMotorWorkMode = 1;
// mMotorWorkDuty = 40;   // 40% = 40*100us = 4ms
// mMotorWorkCycle = 100; // 对应周期10ms 1%=100us 100%= 10ms
void m68_pressure_proc(void)
{
    unsigned char itmp_pressure_level;
    if (m68Pressure > 500)
    {
        itmp_pressure_level = 10;
        mMotorWorkDuty = 100;
        mMotorWorkCycle = 100;
    }
    else
    {
        itmp_pressure_level = (m68Pressure / 50);
        if (itmp_pressure_level > 10)
        {
            itmp_pressure_level = 10;
        }
        switch (itmp_pressure_level)
        {
        case 10:
            itmp_pressure_level = 10;
            mMotorWorkDuty = 100;
            mMotorWorkCycle = 100;
            break;
        case 0:
            yMotorWorkDuty = (yMotorWorkDutyBase + 0);
            break;
        case 1:
            yMotorWorkDuty = (yMotorWorkDutyBase + yMotorWorkStep);
            break;
        case 2:
            yMotorWorkDuty = (yMotorWorkDutyBase + (yMotorWorkStep << 1)); // x2
            break;
        case 3:
            yMotorWorkDuty = (yMotorWorkDutyBase + (yMotorWorkStep << 1) + yMotorWorkStep); // x3
            break;
        case 4:
            yMotorWorkDuty = (yMotorWorkDutyBase + (yMotorWorkStep << 2)); // x4
            break;
        case 5:
            yMotorWorkDuty = (yMotorWorkDutyBase + (yMotorWorkStep << 2) + yMotorWorkStep); // x5
            break;
        case 6:
            yMotorWorkDuty = (yMotorWorkDutyBase + (yMotorWorkStep << 2) + (yMotorWorkStep << 1)); // x6
            break;
        case 7:
            yMotorWorkDuty = (yMotorWorkDutyBase + (yMotorWorkStep << 3) - yMotorWorkStep); // x7
            break;
        case 8:
            yMotorWorkDuty = (yMotorWorkDutyBase + (yMotorWorkStep << 3)); // x8
            break;
        case 9:
            yMotorWorkDuty = (yMotorWorkDutyBase + (yMotorWorkStep << 3) + yMotorWorkStep); // x9
            break;
        default:
            break;
        }
    }
}

void io_uart_tx(unsigned char sendByte)
{

    unsigned char bCount;

    bCount = 8;
    DISI(); // GIE = 0;
    P_IO_UART_TX_OUTPUT;
    P_IO_UART_TX_CLR; // 输出高
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();

    while (bCount)
    {
        if (sendByte & 0x01)
        {
            P_IO_UART_TX_SET; // 输出高
            NOP();
            NOP();
        }
        else
        {
            P_IO_UART_TX_CLR; // 输出低
            NOP();
            NOP();
            NOP();
            NOP();
            NOP();
        }
        bCount--;
        sendByte >>= 1;
    }

    NOP();
    P_IO_UART_TX_SET; // 输出高
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    ENI(); // GIE = 1;
}
//-----------------------------------------------------------------------------------------
void main(void)
{
    DISI();
    PORTA = 0x0C;
    PORTB = 0x02; // 0000 0010 PB1 = 1 m68 power off
    //! 0 -- output; 1 -- input  0100 1110
    IOSTA = 0x4E; // PA5 Input <-- Set PA5 to open drain output
    IOSTB = 0x0C; //

    // APHCON = 0xFF; //! Bit[7:0] : PortA Pull-High Control Register (1:Disable, 0:Pull-High) /PLPA5: Enable/disable Pull-Low resistor of PA5
    BPHCON &= 0xF3; //! Bit[5:0] : PortB Pull-High Control Register (1:Disable, 0:Pull-High)
    // BODCON = 0x10;  // PB4 open-drain

    PCON1 &= (~BIT0); // T0EN = 0;
    T0MD = 0x00;      // 8M,2T  Prescaler0 to timer0 预分频比（Dividing Rate）1:2,
    INTE = 0x01;      // Timer0 overflow interrupt enable bit
    PCON = 0x98;      //  C_WDT_En | C_LVR_En;                // Enable WDT ,  Enable LVR

    PCON1 &= 0xE3;                 // 111 0 00 11
    PCON1 |= (BIT4 | BIT3 | BIT0); // LVDS[2:0] 110 --3.6V,Enable Timer0
    PCON |= BIT5;                  // 开启LVD。
    ENI();                         //  Enable all unmasked interrupts

    delaySleepTime = CONST_DELAY_SLEEP_TIME;

    while (TRUE)
    {
        CLRWDT();

        if (bFlag_gSysTick_Change)
        {
            bFlag_gSysTick_Change = 0;

            gSysTick++;

            if (gSysTick > 99) // 10ms
            {
                gSysTick = 0;
                timer_slice_10ms++;
                get_vin_status();
                Key_Proc();
                if (delay_op_m68_timer)
                {
                    delay_op_m68_timer--;
                }

                if (!(timer_slice_10ms & 0x1F)) // 320ms
                {
                    bFlag_Timeslice_320ms = 1;
                }
            }

            if (bFlag_Timeslice_320ms)
            {
                bFlag_Timeslice_320ms = 0;
                P_DECODE ^= 1;
                bFlag_blink ^= 1;

                if ((yMotorWorkMode) && (yMotorWorkMode < 4))
                {
                    if (0 == delay_op_m68_timer)
                    {
                        get_m68_pressure_nbytes();
                        m68_pressure_proc();
                    }
                }
                get_bat_vol();
                if (red_led_blink_cnt)
                {
                    red_led_blink_cnt--;
                    if (red_led_blink_cnt % 2)
                    {
                        bFlag_light_on = 1;
                        io_uart_tx(0xA1);
                        P_LED_R_OUTPUT;
                        P_LED_R_ON;
                    }
                    else
                    {
                        bFlag_light_on = 0;
                        io_uart_tx(0xA0);
                        P_LED_R_OUTPUT;
                        P_LED_R_OFF;
                    }
                    if (0 == red_led_blink_cnt)
                    {
                        if (bFlag_bat_vol_shutdown)
                        {
                            io_uart_tx(0x22);
                            yMotorWorkMode = 0;
                            yMotorWorkDuty = 0;    // 0/200 = 0%
                            yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
                            Y_BDCM_OFF;
                            M68_POWER_OFF;

                            io_uart_tx(0x11);
                            mMotorWorkMode = 0;
                            mMotorWorkDuty = 0;    // 0% = 0*100us = 0ms
                            mMotorWorkCycle = 100; // 对应周期10ms 1%=100us 100%= 10ms
                            M_BDCM_OFF;
                        }
                    }
                }
                else
                {
                    bFlag_light_on = 0;
                    io_uart_tx(0xA0);
                    P_LED_R_OUTPUT;
                    P_LED_R_OFF;
                }
                if ((yMotorWorkMode) || (mMotorWorkMode))
                {
                    delaySleepTime = CONST_DELAY_SLEEP_TIME;
                }
                if ((0 == bFlag_Vin_Plug_In) && (0 == yMotorWorkMode) && (0 == mMotorWorkMode) && (0 == red_led_blink_cnt))
                {
                    if (!delaySleepTime)
                    {

                        DISI();
                        INTE = 0x00; // Timer0 overflow interrupt enable bit
                        PCON = 0x18;
                        PORTA = 0x0C;
                        PORTB = 0x02;          // PB1 = 1
                        IOSTA = 0x4E;          // PA5 Input <-- Set PA5 to open drain output
                        IOSTB = 0x0C;          // PB5 output PB4 Input
                        AWUCON = C_PA6_Wakeup; //(C_PA5_Wakeup | C_PA4_Wakeup | C_PA0_Wakeup);
                        BWUCON = (C_PB3_Wakeup | C_PB2_Wakeup);
                        INTE = C_INT_PABKey; // Enable PortB input change interrupt
                        INTF = 0;
                        if (0 == P_KEY_M)
                        {
                            goto skip_sleep;
                        }
                        if (0 == P_KEY_Y)
                        {
                            goto skip_sleep;
                        }
                        ADMD = C_ADC_CH_Dis | C_Quarter_VDD;
                        ADMDbits.GCHS = 0; // disable global ADC channel    (SFR "ADMD")
                        UPDATE_REG(PORTB);
                        UPDATE_REG(PORTA);
                        NOP();
                        SLEEP();
                    skip_sleep:
                        INTFbits.PABIF = 0;
                        //-------------------------------休眠-----------------------------------//
                        delaySleepTime = CONST_DELAY_SLEEP_TIME;
                        bFlag_bat_vol_shutdown = 0;
                        if (bFlag_bat_vol_low)
                        {
                            PCON1 &= 0xE3;                 // 111 0 00 11
                            PCON1 |= (BIT4 | BIT2 | BIT0); // LVDS[2:0] 101 --3.3V
                        }
                        else
                        {
                            PCON1 &= 0xE3;                 // 111 0 00 11
                            PCON1 |= (BIT4 | BIT3 | BIT0); // LVDS[2:0] 110 --3.6V
                        }

                        PCON = 0x98;
                        PCON |= BIT5; // 开启LVD。
                        INTE = 0x01;  // Timer0 overflow interrupt enable bit
                        ENI();
                    }
                    else
                    {
                        delaySleepTime--;
                    }
                }
            }
        }
    }
}
