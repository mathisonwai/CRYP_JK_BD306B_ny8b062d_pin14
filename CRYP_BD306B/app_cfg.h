#ifndef __APP_CFG_H_
#define __APP_CFG_H_

//change to cryp

typedef unsigned char           BOOL;
typedef unsigned char           BYTE;
typedef unsigned char           INT8U;
typedef signed char             INT8S;
typedef unsigned int            INT16U;
typedef signed int              INT16S;
typedef unsigned long           INT32U;
typedef signed long             INT32S;
typedef unsigned int            clock_time_t;
typedef unsigned char           u8_t;
typedef signed char             s8_t;
typedef unsigned char           uint8_t;
typedef unsigned int            u16_t;
typedef unsigned int            uint16_t;

typedef signed int              s16_t;
typedef unsigned long int       u32_t;
typedef signed long int         s32_t;
typedef unsigned char           u8;
typedef signed char             s8;
typedef unsigned int            u16;
typedef signed int              s16;
typedef unsigned long           u32;
typedef signed long             s32;
typedef unsigned char           uchar;
typedef unsigned int            uint;
typedef unsigned long           ulong;
typedef unsigned short          WORD;
typedef unsigned long           DWORD;

typedef const signed char       sc8;    /*!< Read Only */
typedef const signed int        sc16;   /*!< Read Only */
typedef const signed long       sc32;   /*!< Read Only */
typedef const unsigned char     uc8;    /*!< Read Only */
typedef const unsigned int      uc16;   /*!< Read Only */
typedef const unsigned long     uc32;   /*!< Read Only */

/*QI的流程名称*/
enum QIPhase
{
    PHASE_INIT               = 0x00, //初始化流程
    PHASE_PING               = 0x01, //Ping阶段             0x01
    PHASE_INFORMATION        = 0x02, //标识阶段             0x71
    PHASE_CONFIG             = 0x03, //配置阶段             0x51
    PHASE_TRINS              = 0x04, //功率传输阶段  误差包 0x03
    PHASE_ERR_POWEROVER      = 0x05, //大功率错误    功率包 0x04
};


typedef struct
{
    unsigned char rear;
    unsigned char front;
} RING_T;


#ifndef TRUE
#define TRUE    (1)
#endif

#ifndef FALSE
#define FALSE   (0)
#endif


#define BIT0        0x01
#define BIT1        0x02
#define BIT2        0x04
#define BIT3        0x08
#define BIT4        0x10
#define BIT5        0x20
#define BIT6        0x40
#define BIT7        0x80


#define  RA0        PORTAbits.PA0
#define  RA1        PORTAbits.PA1
#define  RA2        PORTAbits.PA2
#define  RA3        PORTAbits.PA3
#define  RA4        PORTAbits.PA4
#define  RA5        PORTAbits.PA5
#define  RA6        PORTAbits.PA6
#define  RA7        PORTAbits.PA7

#define  RB0        PORTBbits.PB0
#define  RB1        PORTBbits.PB1
#define  RB2        PORTBbits.PB2
#define  RB3        PORTBbits.PB3
#define  RB4        PORTBbits.PB4
#define  RB5        PORTBbits.PB5
#define  RB6        PORTBbits.PB6
#define  RB7        PORTBbits.PB7

#define TM1IE       INTEbits.T1IE
#define TM0IE       INTEbits.T0IE
#define RBIE        INTEbits.PBIE

#define RABIF       INTFbits.PABIF
#define TM1IF       INTFbits.T1IF
#define TM0IF       INTFbits.T0IF


//054E 16pins
//!--- PIN1
//PB4 PWM1

//! PIN2
//PB5 SEG1

// #define P_HALL_SENSOR                   RA6
// #define P_HALL_SENSOR_CLR               P_HALL_SENSOR = 0
// #define P_HALL_SENSOR_SET               P_HALL_SENSOR = 1
// #define P_HALL_SENSOR_OUTPUT            IOSTA &= (~BIT6)
// #define P_HALL_SENSOR_INPUT             IOSTA |= (BIT6)


//PIN3
//P_CHARGE  -- RA7
// #define P_CHARGE                   RA7
// #define P_CHARGE_CLR               P_CHARGE = 0
// #define P_CHARGE_SET               P_CHARGE = 1
// #define P_CHARGE_OUTPUT            IOSTA &= (~BIT7)
// #define P_CHARGE_INPUT             IOSTA |= (BIT7)

//! pin3 RA7 <-- PIN1 -- DECODE
#define P_DECODE                RA7
#define P_DECODE_SET            P_DECODE = 1
#define P_DECODE_CLR            P_DECODE = 0
#define P_DECODE_OUTPUT         IOSTA &= (~BIT7)
#define P_DECODE_INPUT          IOSTA |= (BIT7)



//! PIN4
//RA5    PIN4



//!PIN5
//RB3--AN8               //NTC AD  <-- OK
#define P_KEY_M                       RB3
#define P_KEY_M_CLR                   P_KEY_Y = 0
#define P_KEY_M_SET                   P_KEY_Y = 1
#define P_KEY_M_OUTPUT            IOSTB &= (~BIT3)
#define P_KEY_M_INPUT             IOSTB |= (BIT3)

//!PIN6
//RB2--AN7

#define P_KEY_Y                       RB2
#define P_KEY_Y_CLR                   P_KEY_Y = 0
#define P_KEY_Y_SET                   P_KEY_Y = 1
#define P_KEY_Y_OUTPUT            IOSTB &= (~BIT2)
#define P_KEY_Y_INPUT             IOSTB |= (BIT2)

//P_NTC_CTL

//!PIN7
//RB1--AN6    //! CSU18M68 power control (PMOS -- 低电平导通 -- 0 power on;1 power off)
//! 最好在GS之间加个电阻  100K-1M
#define P_CTL                       RB1
#define P_CTL_CLR                   P_CTL = 0
#define P_CTL_SET                   P_CTL = 1
#define P_CTL_OUTPUT                IOSTB &= (~BIT1)
#define P_CTL_INPUT                 IOSTB |= (BIT1)
#define M68_POWER_ON                P_CTL_CLR
#define M68_POWER_OFF               P_CTL_SET
//------------------------------------------------------------------------------------


//!PIN8
//RB0--AN0                          //! Y Brush DC Motor <-- OK
#define P_Y_BDCM                     RB0
#define P_Y_BDCM_CLR                 P_Y_BDCM = 0
#define P_Y_BDCM_SET                 P_Y_BDCM = 1
#define P_Y_BDCM_OUTPUT              IOSTB &= (~BIT0)
#define P_Y_BDCM_INPUT               IOSTB |= (BIT0)
#define Y_BDCM_ON                P_Y_BDCM_SET
#define Y_BDCM_OFF               P_Y_BDCM_CLR




//!PIN9 
//RA4--AN2                      //! OK
#define P_I2C_SCL           RA4
#define P_I2C_SCL_CLR       P_I2C_SCL = 0
#define P_I2C_SCL_SET       P_I2C_SCL = 1
#define P_I2C_SCL_OUTPUT    IOSTA &= (~BIT4)
#define P_I2C_SCL_INPUT     IOSTA |= (BIT4)


//!PIN10
//!RA1--AN1

// #define P_LED_R                      RB0
// #define P_LED_R_CLR              P_LED_R = 0
// #define P_LED_R_SET              P_LED_R = 1
// #define P_LED_R_OUTPUT           IOSTB &= (~BIT0)
// #define P_LED_R_INPUT            IOSTB |= (BIT0)
// #define P_LED_R_OFF             P_LED_R_CLR
// #define P_LED_R_ON              P_LED_R_SET

#define P_LED_R                    RA1
#define P_LED_R_CLR              P_LED_R = 0
#define P_LED_R_SET              P_LED_R = 1
#define P_LED_R_OUTPUT   IOSTA &= (~BIT1)
#define P_LED_R_INPUT        IOSTA |= (BIT1)
#define P_LED_R_OFF             P_LED_R_CLR
#define P_LED_R_ON              P_LED_R_SET

// #define P_CHG_FULL                    RA1
// #define P_CHG_FULL_CLR              P_CHG_FULL = 0
// #define P_CHG_FULL_SET              P_CHG_FULL = 1
// #define P_CHG_FULL_OUTPUT   IOSTA &= (~BIT1)
// #define P_CHG_FULL_INPUT        IOSTA |= (BIT1)


//!PIN11
 

//!PIN12
//!RA3-AN3                       //! OK

#define P_I2C_SDA           RA3 
#define P_I2C_SDA_CLR       P_I2C_SDA = 0
#define P_I2C_SDA_SET       P_I2C_SDA = 1
#define P_I2C_SDA_OUTPUT    IOSTA &= (~BIT3)
#define P_I2C_SDA_INPUT     IOSTA |= (BIT3)



//!PIN13
//!RA4 --- AN4                       //NC <-- OK

// #define P_IO_UART_TX        RA4 
// #define P_IO_UART_TX_CLR    P_IO_UART_TX = 0
// #define P_IO_UART_TX_SET    P_IO_UART_TX = 1
// #define P_IO_UART_TX_OUTPUT IOSTA &= (~BIT4)
// #define P_IO_UART_TX_INPUT  IOSTA |= (BIT4)

#define CONST_TIMER_GET_ACK                    250
#define IIC_WRITE   (0) 
#define IIC_READ    (1) 

#define CMD_ARRAY_SIZE  28

#define AD_ARRAY_SIZE       8           //采样8次，这个参数不用改动，防止AD值累加平均出错
#define AD_SUM_SHIFT        3           //右移3次平均


#define AD_CH_AN0         0x00        // AN0 -- PA0
#define AD_CH_AN1             0x01        // AN1 -- PA1
#define AD_CH_V_IN             0x02        // AN2 -- PA2
#define AD_CH_I_L             0x03        // AN3 -- PA3
#define AD_CH_I_R             0x04        // AN4 -- PA4
#define AD_CH_AN5             0x05        // AN5 -- PB0
#define AD_CH_AN6             0x06        // AN6 -- PB1
#define AD_CH_AN7             0x07        // AN7 -- PB2
#define AD_CH_NTC           0x08        // AN8 -- PB3
#define AD_CH_AN9             0x09        // AN9 -- PB4
#define AD_CH_AN10            0x0A        // AN10 -- PB5
#define AD_CH_V_BAT            0x0B        // AN11 -- 1/4 VDD

//AD_CH_I_R

//AD_CH_I_L
#define CONST_KAI_GAI    16  // // 8-- 128ms   16 --256
#define CONST_HE_GAI    255  //  4  sec


#define CONST_MS_CNT        4
#define CONST_RX_TIMER  (30*CONST_MS_CNT)

#define CONST_RX_TIMER_OUT  (10*CONST_MS_CNT)
#define CONST_DELAY_TIMER  16//(16*CONST_MS_CNT)
#define CONST_DLY_OP_M68_TIMER  21 
// #define BREATH_LED_MODE
//#define USING_CHG_FULL

//#define CONST_PRE_CNT           32        // 32 <-- 22

//#define CONST_POWER_DN          0xFE
//#define CONST_POWER_DN_MAX      0xF0
//#define CONST_POWER_BALANCE     0x00
//#define CONST_POWER_UP          0x02

#define CONST_TIMER_5MS             13  // 400us/per
#define CONST_TIMER_2MS             5   // 400us/per

#define CONST_TIMER_34P8            147
#define CONST_LOSS_TIMER            5

#define CONST_DELAY_SLEEP_TIME      20  //320ms*20 = 6sec5
//#define CONST_DISP_ALL_TIMER        7//10//5
#define LED_DISP_TIME               10
#define DISP_TIMER                  1
#define DISP_SHORT_TIMER            6
#define DISP_LONG_TIMER             20
//#define CONST_UV_DISP_TIME          11

//#define MODE_STANDBY                0
//#define MODE_WORKING                1

//#define CONST_RATIO_CAHRGE          42          // <-- 44000/819 = 53.724
//#define CONST_RATIO_DISCAHRGE       48          // <-- 44000/819 = 53.724
//#define CONST_VREF_AD               462         // <-- 461.5

/*
#define CONST_AD_SET_UV             (1542+64)        // 3.14
#define CONST_AD_BAT_CAP_0          (1552+64)        // 3.16
#define CONST_AD_CLEAR_UV           (1695+64)        // 3.452
#define CONST_AD_BAT_CAP_100        (2052+64)        // 4.176
#define CONST_AD_BAT_FULL           (2057+64)        // 4.187
#define CONST_AD_1PER               5           // (2052 - 1552)/100
*/

#define CONST_PY                    0//(64)
#define CONST_AD_SET_UV             (1542+CONST_PY)        // 3.14
#define CONST_AD_BAT_CAP_0          (1552+CONST_PY)        // 3.16
#define CONST_AD_CLEAR_UV           (1695+CONST_PY)        // 3.452
#define CONST_AD_BAT_CAP_100        (2052+CONST_PY)        // 4.176
#define CONST_AD_BAT_FULL           (2057+CONST_PY)        // 4.187
#define CONST_AD_1PER               5           // (2052 - 1552)/100



#define CMD_INTERVALNUM                 (400)
#define CMD_QUEUE_SIZE                  (4)
#define CONST_SCS_START_TIMER           (625)           // 40ms
#define CONST_SCS_SEND_ONE_BIT_TIMER    (625)           // 40ms
#define CONST_INTERVAL_TIMER            (6250)          // 400ms
#define CONST_GAP_TIMER                 (4688)



#define CMD_FACTORY_SET         (0x04)          // 0000 0100  发命令给耳机恢复出厂设置
#define CMD_BT_POWER_ON         (0x0E)          // 0000 1110  BT POWER ON
#define CMD_BT_POWER_OFF        (0x10)          // 0001 0000  BT POWER OFF
#define CMD_IN_PAIRING_MODE     (0x12)          // 0001 0010  Enter Pairing Mode
#define CMD_IN_DUT_MODE         (0x20)          // 0010 0000  Enter DUT Mode




typedef struct
{
    unsigned char head;
    unsigned char tail;
} T_Buf_Info;

typedef enum _SMART_CHARGER_STATE
{
    SCS_IDLE,
    SCS_WAIT,
    SCS_START,
    SCS_SEND_DATA,
} SMART_CHARGER_STATE;


typedef   struct _BIN_CMD
{
    u8_t  status;           //
    u8_t  len;              //
    u8_t  recing_len;       //
} BIN_CMD_T;


#define  REC_INIT               0
#define  REC_SYN                1
#define  REC_CMD                2
#define  REC_LEN                3
#define  REC_DATA               4
#define  REC_BAT_VOL             5

#define  REC_CRC8               6

#define  GET_CMD_NORMAL         0
#define  GET_CMD_OK             1
#define  GET_CMD_FAIL           2






//#define KEY_EVENT_BASE_ADDR         0xA0

//#define MSG_NONE                  0x00
#define KEY_BREAK                   0x20     //
#define KEY_LONG_START              0x40     //
#define KEY_LONG                    0x80     //
#define KEY_LONG_BREAK              0x60     //important

#define K1                          0x01
#define K1_BREAK                    0x21
#define K1_LONG_START               0x41
#define K1_LONG                     0x81
#define K1_LONG_BREAK               0x61

//! timer 10ms
#define GPIO_KEY_JTTER_TIME             3       //30ms
#define GPIO_KEY_CP_TIME                150     //1sec5
#define GPIO_KEY_CPH_TIME               25      //250ms  


typedef enum _GPIO_KEY_STATE
{
    GPIO_KEY_STATE_IDLE,
    GPIO_KEY_STATE_JITTER,
    GPIO_KEY_STATE_PRESS_DOWN,
    GPIO_KEY_STATE_CP

} GPIO_KEY_STATE;


typedef enum _KEY_EVENT
{
    MSG_NONE = 0x00,

    MSG_FAN_MODE = K1,                         // -- [0x01,0x1F] //! PDS(按键开始)
    MSG_M_PDS,
    MSG_Y_PDS,
    MSG_MY_PDS,
    //TODO:

    MSG_MODE = K1_BREAK,             // -- [0x21,0x3F]//! SPR(短按松开)
    MSG_LIGHT_SPR,
    MSG_M_SPR,
    MSG_Y_SPR,
    MSG_MY_SPR,
    //TODO:

    MSG_POWER_ON = K1_LONG_START,   // -- [0x41,0x5F] //! CPS(长按开始)，
    MSG_LIGHT_CPS,
    MSG_M_CPS,
    MSG_Y_CPS,
    MSG_MY_CPS,
    //TODO:

    KEY_POWER_LONG_BREAK = K1_LONG_BREAK,   // -- [0x61,0x7F]
    MSG_LIGHT_CPR,
    MSG_M_CPR,
    MSG_Y_CPR,
    MSG_MY_CPR,
    //TODO:

    KEY_POWER_LONG = K1_LONG,               // -- [0x81,0x5F]
    MSG_LIGHT_CPH,
    MSG_M_CPH,
    MSG_Y_CPH,
    MSG_MY_CPH,
    //TODO:

} KEY_EVENT;


#endif/* __HC_DEFINE_H__ */
