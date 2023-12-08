;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8B062D,c=on
	#include "ny8b062d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__divuint
	extern	__muluchar
	extern	_clear_ram
	extern	_multi_16b
	extern	_T0MD
	extern	_PCON1
	extern	_CMPCR
	extern	_BODCON
	extern	_PS0CV
	extern	_APHCON
	extern	_IOSTB
	extern	_IOSTA
	extern	_BZ3CR
	extern	_PS3CV
	extern	_PWM3DUTY
	extern	_T3CR2
	extern	_T3CR1
	extern	_TMR3
	extern	_OSCCR
	extern	_BZ2CR
	extern	_PS2CV
	extern	_PWM2DUTY
	extern	_T2CR2
	extern	_T2CR1
	extern	_TMR2
	extern	_TBHD
	extern	_TBHP
	extern	_IRCR
	extern	_BZ1CR
	extern	_PS1CV
	extern	_PWM1DUTY
	extern	_T1CR2
	extern	_T1CR1
	extern	_TMR1
	extern	_TM3RH
	extern	_TMRH
	extern	_ADD
	extern	_PCHBUF
	extern	_STATUS
	extern	_PCL
	extern	_TMR0
	extern	_INTE2bits
	extern	_RFCbits
	extern	_ANAENbits
	extern	_INTEDGbits
	extern	_PACONbits
	extern	_AWUCONbits
	extern	_ADCRbits
	extern	_ADVREFHbits
	extern	_ADRbits
	extern	_ADMDbits
	extern	_INTFbits
	extern	_INTEbits
	extern	_BPHCONbits
	extern	_ABPLCONbits
	extern	_BWUCONbits
	extern	_PCONbits
	extern	_PORTBbits
	extern	_PORTAbits
	extern	__gptrget1
	extern	__gptrput1
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_main
	extern	_m68_pressure_proc
	extern	_get_m68_pressure_nbytes
	extern	_ip53xs_read_nBytes
	extern	_ip53xs_writeByte
	extern	_i2c_readByte
	extern	_i2c_writeByte
	extern	_i2c_send_nack
	extern	_i2c_send_ack
	extern	_i2c_chk_ack
	extern	_i2c_stop
	extern	_i2c_start
	extern	_Key_Proc
	extern	_gpioKeyScan
	extern	_get_bat_vol
	extern	_get_vin_status
	extern	__dly_us
	extern	_isr
	extern	_gpioKeyEvent
	extern	_INTE2
	extern	_RFC
	extern	_ANAEN
	extern	_INTEDG
	extern	_PACON
	extern	_AWUCON
	extern	_ADCR
	extern	_ADVREFH
	extern	_ADR
	extern	_ADMD
	extern	_INTF
	extern	_INTE
	extern	_BPHCON
	extern	_ABPLCON
	extern	_BWUCON
	extern	_PCON
	extern	_PORTB
	extern	_PORTA
	extern	_m68Pressure2
	extern	_m68Pressure
	extern	_gSysTick
	extern	_gpioKeyState
	extern	_gpioKeyWaitTimer
	extern	_delaySleepTime
	extern	_timer_slice_10ms
	extern	_delay_op_m68_timer
	extern	_yMotorWorkStep
	extern	_yMotorWorkCycle
	extern	_yMotorWorkDutyBase
	extern	_yMotorWorkDuty
	extern	_yMotorWorkMode
	extern	_mMotorWorkCycle
	extern	_mMotorWorkDuty
	extern	_mMotorWorkMode4Cnt
	extern	_mMotorWorkMode
	extern	_red_led_blink_cnt
	extern	_vFlag_0
	extern	_io_uart_tx

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00

.segment "share_bank"
PSAVE:
	.res 1
.segment "share_bank"
SSAVE:
	.res 1
.segment "share_bank"
WSAVE:
	.res 1
.segment "share_bank"
STK12:
	.res 1
.segment "share_bank"
STK11:
	.res 1
.segment "share_bank"
STK10:
	.res 1
.segment "share_bank"
STK09:
	.res 1
.segment "share_bank"
STK08:
	.res 1
.segment "share_bank"
STK07:
	.res 1
.segment "share_bank"
STK06:
	.res 1
.segment "share_bank"
STK05:
	.res 1
.segment "share_bank"
STK04:
	.res 1
.segment "share_bank"
STK03:
	.res 1
.segment "share_bank"
STK02:
	.res 1
.segment "share_bank"
STK01:
	.res 1
.segment "share_bank"
STK00:
	.res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_vFlag_0:
	.res 1
	.debuginfo complex-type (symbol "_vFlag_0" 1 global "main.c" 29 (basetype 1 unsigned))

.segment "uninit"
_red_led_blink_cnt:
	.res 1
	.debuginfo complex-type (symbol "_red_led_blink_cnt" 1 global "main.c" 59 (basetype 1 unsigned))

.segment "uninit"
_mMotorWorkMode:
	.res 1
	.debuginfo complex-type (symbol "_mMotorWorkMode" 1 global "main.c" 60 (basetype 1 unsigned))

.segment "uninit"
_mMotorWorkMode4Cnt:
	.res 1
	.debuginfo complex-type (symbol "_mMotorWorkMode4Cnt" 1 global "main.c" 61 (basetype 1 unsigned))

.segment "uninit"
_mMotorWorkDuty:
	.res 2
	.debuginfo complex-type (symbol "_mMotorWorkDuty" 2 global "main.c" 62 (basetype 2 unsigned))

.segment "uninit"
_mMotorWorkCycle:
	.res 2
	.debuginfo complex-type (symbol "_mMotorWorkCycle" 2 global "main.c" 63 (basetype 2 unsigned))

.segment "uninit"
_yMotorWorkMode:
	.res 1
	.debuginfo complex-type (symbol "_yMotorWorkMode" 1 global "main.c" 64 (basetype 1 unsigned))

.segment "uninit"
_yMotorWorkDuty:
	.res 1
	.debuginfo complex-type (symbol "_yMotorWorkDuty" 1 global "main.c" 65 (basetype 1 unsigned))

.segment "uninit"
_yMotorWorkDutyBase:
	.res 1
	.debuginfo complex-type (symbol "_yMotorWorkDutyBase" 1 global "main.c" 66 (basetype 1 unsigned))

.segment "uninit"
_yMotorWorkCycle:
	.res 1
	.debuginfo complex-type (symbol "_yMotorWorkCycle" 1 global "main.c" 67 (basetype 1 unsigned))

.segment "uninit"
_yMotorWorkStep:
	.res 1
	.debuginfo complex-type (symbol "_yMotorWorkStep" 1 global "main.c" 68 (basetype 1 unsigned))

.segment "uninit"
_delay_op_m68_timer:
	.res 1
	.debuginfo complex-type (symbol "_delay_op_m68_timer" 1 global "main.c" 69 (basetype 1 unsigned))

.segment "uninit"
_timer_slice_10ms:
	.res 1
	.debuginfo complex-type (symbol "_timer_slice_10ms" 1 global "main.c" 70 (basetype 1 unsigned))

.segment "uninit"
_delaySleepTime:
	.res 1
	.debuginfo complex-type (symbol "_delaySleepTime" 1 global "main.c" 71 (basetype 1 unsigned))

.segment "uninit"
_gpioKeyWaitTimer:
	.res 1
	.debuginfo complex-type (symbol "_gpioKeyWaitTimer" 1 global "main.c" 72 (basetype 1 unsigned))

.segment "uninit"
_gpioKeyState:
	.res 1
	.debuginfo complex-type (symbol "_gpioKeyState" 1 global "main.c" 73 (basetype 1 unsigned))

.segment "uninit"
_gSysTick:
	.res 1
	.debuginfo complex-type (symbol "_gSysTick" 1 global "main.c" 79 (basetype 1 unsigned))

.segment "uninit"
_m68Pressure:
	.res 2
	.debuginfo complex-type (symbol "_m68Pressure" 2 global "main.c" 80 (basetype 2 unsigned))

.segment "uninit"
_m68Pressure2:
	.res 2
	.debuginfo complex-type (symbol "_m68Pressure2" 2 global "main.c" 81 (basetype 2 unsigned))

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
_isr_yTimerCnt_65536_5:
	.res	1
	.debuginfo complex-type (symbol "_isr_yTimerCnt_65536_5" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
_isr_mTimerCnt_65536_5:
	.res	2
	.debuginfo complex-type (symbol "_isr_mTimerCnt_65536_5" 2 global "" 0 (basetype 2 unsigned))
.segment "uninit"
___sdcc_saved_fsr:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_fsr" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_stk00:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_stk00" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_stk01:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_stk01" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_stk02:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_stk02" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_stk03:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_stk03" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_stk04:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_stk04" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
_get_vin_status_counter_65536_22:
	.res	1
	.debuginfo complex-type (symbol "_get_vin_status_counter_65536_22" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
_get_bat_vol_counter_65536_32:
	.res	1
	.debuginfo complex-type (symbol "_get_bat_vol_counter_65536_32" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
_get_m68_pressure_nbytes_reg_buffer_65536_109:
	.res	4
	.debuginfo complex-type (symbol "_get_m68_pressure_nbytes_reg_buffer_65536_109" 4 global "" 0 (basetype 4 unsigned))
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_gpioKeyScan_prekeyIndex_65536_43:
	.debuginfo complex-type (symbol "_gpioKeyScan_prekeyIndex_65536_43" 1 local "main.c" 277 (basetype 1 unsigned))

	dw	0xff	; 255


.segment "code"
_gpioKeyEvent:
	retia 0x00	; 0
	retia 0x23	; 35
	retia 0x43	; 67	'C'
	retia 0x00	; 0
	retia 0x00	; 0
	retia 0x00	; 0
	retia 0x24	; 36
	retia 0x44	; 68	'D'
	retia 0x00	; 0
	retia 0x00	; 0
	retia 0x00	; 0
	retia 0x00	; 0
	retia 0x45	; 69	'E'
	retia 0x00	; 0
	retia 0x00	; 0
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
ORG	0x0000
	LGOTO	__nyc_ny8_startup
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
ORG 0x0008
	MGOTO	__sdcc_interrupt

.segment "code"
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;6 compiler assigned registers:
;   STK00
;   STK01
;   STK02
;   STK03
;   STK04
;   r0x103E
;; Starting pCode block
_isr:
; 0 exit points
	.line	111, "main.c"; 	void isr(void) __interrupt(0) // 64us   //! 100us -- 10ms
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	BANKSEL	___sdcc_saved_stk00
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	BANKSEL	___sdcc_saved_stk01
	MOVAR	___sdcc_saved_stk01
	MOVR	STK02,W
	BANKSEL	___sdcc_saved_stk02
	MOVAR	___sdcc_saved_stk02
	MOVR	STK03,W
	BANKSEL	___sdcc_saved_stk03
	MOVAR	___sdcc_saved_stk03
	MOVR	STK04,W
	BANKSEL	___sdcc_saved_stk04
	MOVAR	___sdcc_saved_stk04
	.line	116, "main.c"; 	if (TM0IF)
	BTRSS	_INTFbits,0
	MGOTO	_02027_DS_
	.line	118, "main.c"; 	TM0IF = 0;
	MOVIA	0xfe
	MOVAR	(_INTFbits + 0)
	.line	119, "main.c"; 	TMR0 = 0x47;               // 125 138;//0x0F;  34.8us
	MOVIA	0x47
	MOVAR	_TMR0
	.line	120, "main.c"; 	bFlag_gSysTick_Change = 1; // 128us
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,0
	.line	121, "main.c"; 	if (yMotorWorkMode)
	BANKSEL	_yMotorWorkMode
	MOVR	_yMotorWorkMode,W
	BTRSC	STATUS,2
	MGOTO	_02011_DS_
	.line	123, "main.c"; 	yTimerCnt++;
	BANKSEL	_isr_yTimerCnt_65536_5
	INCR	_isr_yTimerCnt_65536_5,F
	.line	124, "main.c"; 	if (yTimerCnt >= yMotorWorkCycle)
	BANKSEL	_yMotorWorkCycle
	MOVR	_yMotorWorkCycle,W
	BANKSEL	_isr_yTimerCnt_65536_5
	SUBAR	_isr_yTimerCnt_65536_5,W
	BTRSC	STATUS,0
	.line	126, "main.c"; 	yTimerCnt = 0;
	CLRR	_isr_yTimerCnt_65536_5
	.line	128, "main.c"; 	if (yTimerCnt < yMotorWorkDuty)
	BANKSEL	_yMotorWorkDuty
	MOVR	_yMotorWorkDuty,W
	BANKSEL	_isr_yTimerCnt_65536_5
	SUBAR	_isr_yTimerCnt_65536_5,W
	BTRSC	STATUS,0
	MGOTO	_02008_DS_
	.line	130, "main.c"; 	Y_BDCM_ON;
	BSR	_PORTBbits,0
	MGOTO	_02011_DS_
_02008_DS_:
	.line	134, "main.c"; 	Y_BDCM_OFF;
	BCR	_PORTBbits,0
_02011_DS_:
	.line	137, "main.c"; 	if (mMotorWorkMode)
	BANKSEL	_mMotorWorkMode
	MOVR	_mMotorWorkMode,W
	BTRSC	STATUS,2
	MGOTO	_02027_DS_
	.line	139, "main.c"; 	mTimerCnt++;
	BANKSEL	_isr_mTimerCnt_65536_5
	INCR	_isr_mTimerCnt_65536_5,F
	BTRSC	STATUS,2
	INCR	(_isr_mTimerCnt_65536_5 + 1),F
	.line	140, "main.c"; 	if (mTimerCnt >= mMotorWorkCycle)
	BANKSEL	_mMotorWorkCycle
	MOVR	_mMotorWorkCycle,W
	BANKSEL	_isr_mTimerCnt_65536_5
	SUBAR	_isr_mTimerCnt_65536_5,W
	BANKSEL	_mMotorWorkCycle
	MOVR	(_mMotorWorkCycle + 1),W
	BANKSEL	_isr_mTimerCnt_65536_5
	SBCAR	(_isr_mTimerCnt_65536_5 + 1),W
	BTRSS	STATUS,0
	MGOTO	_02019_DS_
	.line	142, "main.c"; 	mTimerCnt = 0;
	CLRR	_isr_mTimerCnt_65536_5
	CLRR	(_isr_mTimerCnt_65536_5 + 1)
	.line	143, "main.c"; 	if (4 == mMotorWorkMode)
	BANKSEL	_mMotorWorkMode
	MOVR	_mMotorWorkMode,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_02019_DS_
	.line	145, "main.c"; 	mMotorWorkMode4Cnt++; // 0 1 2 3
	BANKSEL	_mMotorWorkMode4Cnt
	MOVR	_mMotorWorkMode4Cnt,W
	BANKSEL	r0x103E
	MOVAR	r0x103E
	INCR	r0x103E,W
	BANKSEL	_mMotorWorkMode4Cnt
	MOVAR	_mMotorWorkMode4Cnt
	.line	146, "main.c"; 	if (3 == mMotorWorkMode4Cnt)
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_02013_DS_
	.line	149, "main.c"; 	mMotorWorkDuty = 10000;  // 50% --- 200ms = 2000*100us
	MOVIA	0x10
	BANKSEL	_mMotorWorkDuty
	MOVAR	_mMotorWorkDuty
	MOVIA	0x27
	MOVAR	(_mMotorWorkDuty + 1)
	.line	150, "main.c"; 	mMotorWorkCycle = 12500; // 对应周期1250ms 12500*100us
	MOVIA	0xd4
	BANKSEL	_mMotorWorkCycle
	MOVAR	_mMotorWorkCycle
	MOVIA	0x30
	MOVAR	(_mMotorWorkCycle + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x4=4), size=1
_02013_DS_:
	.line	152, "main.c"; 	if (mMotorWorkMode4Cnt > 3)
	MOVIA	0x04
	BANKSEL	_mMotorWorkMode4Cnt
	SUBAR	_mMotorWorkMode4Cnt,W
	BTRSS	STATUS,0
	MGOTO	_02019_DS_
	.line	154, "main.c"; 	mMotorWorkMode4Cnt = 0;
	CLRR	_mMotorWorkMode4Cnt
	.line	155, "main.c"; 	mMotorWorkDuty = 2000;  // 50% --- 200ms = 2000*100us
	MOVIA	0xd0
	BANKSEL	_mMotorWorkDuty
	MOVAR	_mMotorWorkDuty
	MOVIA	0x07
	MOVAR	(_mMotorWorkDuty + 1)
	.line	156, "main.c"; 	mMotorWorkCycle = 4000; // 对应周期400ms 1%=4ms 100%= 10ms
	MOVIA	0xa0
	BANKSEL	_mMotorWorkCycle
	MOVAR	_mMotorWorkCycle
	MOVIA	0x0f
	MOVAR	(_mMotorWorkCycle + 1)
_02019_DS_:
	.line	161, "main.c"; 	if (mTimerCnt < mMotorWorkDuty)
	BANKSEL	_mMotorWorkDuty
	MOVR	_mMotorWorkDuty,W
	BANKSEL	_isr_mTimerCnt_65536_5
	SUBAR	_isr_mTimerCnt_65536_5,W
	BANKSEL	_mMotorWorkDuty
	MOVR	(_mMotorWorkDuty + 1),W
	BANKSEL	_isr_mTimerCnt_65536_5
	SBCAR	(_isr_mTimerCnt_65536_5 + 1),W
	BTRSC	STATUS,0
	MGOTO	_02021_DS_
	.line	163, "main.c"; 	M_BDCM_ON;
	BSR	_PORTAbits,0
	MGOTO	_02027_DS_
_02021_DS_:
	.line	167, "main.c"; 	M_BDCM_OFF;
	BCR	_PORTAbits,0
_02027_DS_:
	.line	171, "main.c"; 	}
	BANKSEL	___sdcc_saved_stk04
	MOVR	___sdcc_saved_stk04,W
	MOVAR	STK04
	BANKSEL	___sdcc_saved_stk03
	MOVR	___sdcc_saved_stk03,W
	MOVAR	STK03
	BANKSEL	___sdcc_saved_stk02
	MOVR	___sdcc_saved_stk02,W
	MOVAR	STK02
	BANKSEL	___sdcc_saved_stk01
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	BANKSEL	___sdcc_saved_stk00
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
	BANKSEL	___sdcc_saved_fsr
	MOVR	___sdcc_saved_fsr,W
	MOVAR	FSR
	MOVR	PSAVE,W
	MOVAR	PCHBUF
	CLRR	STATUS
	SWAPR	SSAVE,W
	MOVAR	STATUS
	SWAPR	WSAVE,F
	SWAPR	WSAVE,W
END_OF_INTERRUPT:
	RETIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
; code_main	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _get_vin_status
;   _Key_Proc
;   _get_m68_pressure_nbytes
;   _m68_pressure_proc
;   _get_bat_vol
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _get_vin_status
;   _Key_Proc
;   _get_m68_pressure_nbytes
;   _m68_pressure_proc
;   _get_bat_vol
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;1 compiler assigned register :
;   r0x103A
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	980, "main.c"; 	DISI();
	DISI
	.line	981, "main.c"; 	PORTA = 0x0C;
	MOVIA	0x0c
	MOVAR	_PORTA
	.line	982, "main.c"; 	PORTB = 0x02; // 0000 0010 PB1 = 1 m68 power off
	MOVIA	0x02
	MOVAR	_PORTB
	.line	984, "main.c"; 	IOSTA = 0x4E; // PA5 Input <-- Set PA5 to open drain output
	MOVIA	0x4e
	IOST	_IOSTA
	.line	985, "main.c"; 	IOSTB = 0x0C; //
	MOVIA	0x0c
	IOST	_IOSTB
	.line	988, "main.c"; 	BPHCON &= 0xF3; //! Bit[5:0] : PortB Pull-High Control Register (1:Disable, 0:Pull-High)
	MOVIA	0xf3
	ANDAR	_BPHCON,F
	.line	991, "main.c"; 	PCON1 &= (~BIT0); // T0EN = 0;
	IOSTR	_PCON1
	BANKSEL	r0x103A
	MOVAR	r0x103A
	BCR	r0x103A,0
	MOVR	r0x103A,W
	IOST	_PCON1
	.line	992, "main.c"; 	T0MD = 0x00;      // 8M,2T  Prescaler0 to timer0 预分频比（Dividing Rate）1:2,
	CLRA	
	T0MD	
	.line	993, "main.c"; 	INTE = 0x01;      // Timer0 overflow interrupt enable bit
	MOVIA	0x01
	MOVAR	_INTE
	.line	994, "main.c"; 	PCON = 0x98;      //  C_WDT_En | C_LVR_En;                // Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	996, "main.c"; 	PCON1 &= 0xE3;                 // 111 0 00 11
	IOSTR	_PCON1
	MOVAR	r0x103A
	MOVIA	0xe3
	ANDAR	r0x103A,F
	MOVR	r0x103A,W
	IOST	_PCON1
	.line	997, "main.c"; 	PCON1 |= (BIT4 | BIT3 | BIT0); // LVDS[2:0] 110 --3.6V,Enable Timer0
	IOSTR	_PCON1
	MOVAR	r0x103A
	MOVIA	0x19
	IORAR	r0x103A,F
	MOVR	r0x103A,W
	IOST	_PCON1
	.line	998, "main.c"; 	PCON |= BIT5;                  // 开启LVD。
	BSR	_PCON,5
	.line	999, "main.c"; 	ENI();                         //  Enable all unmasked interrupts
	ENI
	.line	1001, "main.c"; 	delaySleepTime = CONST_DELAY_SLEEP_TIME;
	MOVIA	0x14
	BANKSEL	_delaySleepTime
	MOVAR	_delaySleepTime
_02547_DS_:
	.line	1005, "main.c"; 	CLRWDT();
	clrwdt
	.line	1007, "main.c"; 	if (bFlag_gSysTick_Change)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,0
	MGOTO	_02547_DS_
	.line	1009, "main.c"; 	bFlag_gSysTick_Change = 0;
	BCR	_vFlag_0,0
	.line	1011, "main.c"; 	gSysTick++;
	BANKSEL	_gSysTick
	MOVR	_gSysTick,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
	INCR	r0x103A,W
	BANKSEL	_gSysTick
	MOVAR	_gSysTick
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x64=100), size=1
	.line	1013, "main.c"; 	if (gSysTick > 99) // 10ms
	MOVIA	0x64
	SUBAR	_gSysTick,W
	BTRSS	STATUS,0
	MGOTO	_00001_DS_
	.line	1015, "main.c"; 	gSysTick = 0;
	CLRR	_gSysTick
	.line	1016, "main.c"; 	timer_slice_10ms++;
	BANKSEL	_timer_slice_10ms
	MOVR	_timer_slice_10ms,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
	INCR	r0x103A,W
	BANKSEL	_timer_slice_10ms
	MOVAR	_timer_slice_10ms
	.line	1017, "main.c"; 	get_vin_status();
	MCALL	_get_vin_status
	.line	1018, "main.c"; 	Key_Proc();
	MCALL	_Key_Proc
	.line	1019, "main.c"; 	if (delay_op_m68_timer)
	BANKSEL	_delay_op_m68_timer
	MOVR	_delay_op_m68_timer,W
	BTRSC	STATUS,2
	MGOTO	_02503_DS_
	.line	1021, "main.c"; 	delay_op_m68_timer--;
	MOVR	_delay_op_m68_timer,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
	DECR	r0x103A,W
	BANKSEL	_delay_op_m68_timer
	MOVAR	_delay_op_m68_timer
_02503_DS_:
	.line	1024, "main.c"; 	if (!(timer_slice_10ms & 0x1F)) // 320ms
	BANKSEL	_timer_slice_10ms
	MOVR	_timer_slice_10ms,W
	ANDIA	0x1f
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	.line	1026, "main.c"; 	bFlag_Timeslice_320ms = 1;
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,1
_00001_DS_:
	.line	1030, "main.c"; 	if (bFlag_Timeslice_320ms)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,1
	MGOTO	_02547_DS_
	.line	1032, "main.c"; 	bFlag_Timeslice_320ms = 0;
	BCR	_vFlag_0,1
	.line	1033, "main.c"; 	P_DECODE ^= 1;
	BANKSEL	r0x103A
	CLRR	r0x103A
	BTRSC	_PORTAbits,7
	INCR	r0x103A,F
	MOVIA	0x01
	XORAR	r0x103A,F
	RRR	r0x103A,W
	BTRSS	STATUS,0
	BCR	_PORTAbits,7
	BTRSC	STATUS,0
	BSR	_PORTAbits,7
	.line	1034, "main.c"; 	bFlag_blink ^= 1;
	MOVIA	0x80
	BANKSEL	_vFlag_0
	XORAR	_vFlag_0,F
	.line	1036, "main.c"; 	if ((yMotorWorkMode) && (yMotorWorkMode < 4))
	BANKSEL	_yMotorWorkMode
	MOVR	_yMotorWorkMode,W
	BTRSC	STATUS,2
	MGOTO	_02511_DS_
;;unsigned compare: left < lit(0x4=4), size=1
	MOVIA	0x04
	SUBAR	_yMotorWorkMode,W
	BTRSC	STATUS,0
	MGOTO	_02511_DS_
	.line	1038, "main.c"; 	if (0 == delay_op_m68_timer)
	BANKSEL	_delay_op_m68_timer
	MOVR	_delay_op_m68_timer,W
	BTRSS	STATUS,2
	MGOTO	_02511_DS_
	.line	1040, "main.c"; 	get_m68_pressure_nbytes();
	MCALL	_get_m68_pressure_nbytes
	.line	1041, "main.c"; 	m68_pressure_proc();
	MCALL	_m68_pressure_proc
_02511_DS_:
	.line	1044, "main.c"; 	get_bat_vol();
	MCALL	_get_bat_vol
	.line	1045, "main.c"; 	if (red_led_blink_cnt)
	BANKSEL	_red_led_blink_cnt
	MOVR	_red_led_blink_cnt,W
	BTRSC	STATUS,2
	MGOTO	_02521_DS_
	.line	1047, "main.c"; 	red_led_blink_cnt--;
	MOVR	_red_led_blink_cnt,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
	DECR	r0x103A,W
	BANKSEL	_red_led_blink_cnt
	MOVAR	_red_led_blink_cnt
	.line	1048, "main.c"; 	if (red_led_blink_cnt % 2)
	BTRSS	_red_led_blink_cnt,0
	MGOTO	_02514_DS_
	.line	1050, "main.c"; 	bFlag_light_on = 1;
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,3
	.line	1051, "main.c"; 	io_uart_tx(0xA1);
	MOVIA	0xa1
	MCALL	_io_uart_tx
	.line	1052, "main.c"; 	P_LED_R_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x103A
	MOVAR	r0x103A
	BCR	r0x103A,1
	MOVR	r0x103A,W
	IOST	_IOSTA
	.line	1053, "main.c"; 	P_LED_R_ON;
	BSR	_PORTAbits,1
	MGOTO	_02515_DS_
_02514_DS_:
	.line	1057, "main.c"; 	bFlag_light_on = 0;
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,3
	.line	1058, "main.c"; 	io_uart_tx(0xA0);
	MOVIA	0xa0
	MCALL	_io_uart_tx
	.line	1059, "main.c"; 	P_LED_R_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x103A
	MOVAR	r0x103A
	BCR	r0x103A,1
	MOVR	r0x103A,W
	IOST	_IOSTA
	.line	1060, "main.c"; 	P_LED_R_OFF;
	BCR	_PORTAbits,1
_02515_DS_:
	.line	1062, "main.c"; 	if (0 == red_led_blink_cnt)
	BANKSEL	_red_led_blink_cnt
	MOVR	_red_led_blink_cnt,W
	BTRSS	STATUS,2
	MGOTO	_02522_DS_
	.line	1064, "main.c"; 	if (bFlag_bat_vol_shutdown)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,6
	MGOTO	_02522_DS_
	.line	1066, "main.c"; 	io_uart_tx(0x22);
	MOVIA	0x22
	MCALL	_io_uart_tx
	.line	1067, "main.c"; 	yMotorWorkMode = 0;
	BANKSEL	_yMotorWorkMode
	CLRR	_yMotorWorkMode
	.line	1068, "main.c"; 	yMotorWorkDuty = 0;    // 0/200 = 0%
	BANKSEL	_yMotorWorkDuty
	CLRR	_yMotorWorkDuty
	.line	1069, "main.c"; 	yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
	MOVIA	0xc8
	BANKSEL	_yMotorWorkCycle
	MOVAR	_yMotorWorkCycle
	.line	1070, "main.c"; 	Y_BDCM_OFF;
	BCR	_PORTBbits,0
	.line	1071, "main.c"; 	M68_POWER_OFF;
	BSR	_PORTBbits,1
	.line	1073, "main.c"; 	io_uart_tx(0x11);
	MOVIA	0x11
	MCALL	_io_uart_tx
	.line	1074, "main.c"; 	mMotorWorkMode = 0;
	BANKSEL	_mMotorWorkMode
	CLRR	_mMotorWorkMode
	.line	1075, "main.c"; 	mMotorWorkDuty = 0;    // 0% = 0*100us = 0ms
	BANKSEL	_mMotorWorkDuty
	CLRR	_mMotorWorkDuty
	CLRR	(_mMotorWorkDuty + 1)
	.line	1076, "main.c"; 	mMotorWorkCycle = 100; // 对应周期10ms 1%=100us 100%= 10ms
	MOVIA	0x64
	BANKSEL	_mMotorWorkCycle
	MOVAR	_mMotorWorkCycle
	CLRR	(_mMotorWorkCycle + 1)
	.line	1077, "main.c"; 	M_BDCM_OFF;
	BCR	_PORTAbits,0
	MGOTO	_02522_DS_
_02521_DS_:
	.line	1083, "main.c"; 	bFlag_light_on = 0;
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,3
	.line	1084, "main.c"; 	io_uart_tx(0xA0);
	MOVIA	0xa0
	MCALL	_io_uart_tx
	.line	1085, "main.c"; 	P_LED_R_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x103A
	MOVAR	r0x103A
	BCR	r0x103A,1
	MOVR	r0x103A,W
	IOST	_IOSTA
	.line	1086, "main.c"; 	P_LED_R_OFF;
	BCR	_PORTAbits,1
_02522_DS_:
	.line	1088, "main.c"; 	if ((yMotorWorkMode) || (mMotorWorkMode))
	BANKSEL	_yMotorWorkMode
	MOVR	_yMotorWorkMode,W
	BTRSS	STATUS,2
	MGOTO	_02523_DS_
	BANKSEL	_mMotorWorkMode
	MOVR	_mMotorWorkMode,W
	BTRSC	STATUS,2
	MGOTO	_02524_DS_
_02523_DS_:
	.line	1090, "main.c"; 	delaySleepTime = CONST_DELAY_SLEEP_TIME;
	MOVIA	0x14
	BANKSEL	_delaySleepTime
	MOVAR	_delaySleepTime
_02524_DS_:
	.line	1092, "main.c"; 	if ((0 == bFlag_Vin_Plug_In) && (0 == yMotorWorkMode) && (0 == mMotorWorkMode) && (0 == red_led_blink_cnt))
	BANKSEL	_vFlag_0
	BTRSC	_vFlag_0,4
	MGOTO	_02547_DS_
	BANKSEL	_yMotorWorkMode
	MOVR	_yMotorWorkMode,W
	BTRSS	STATUS,2
	MGOTO	_02547_DS_
	BANKSEL	_mMotorWorkMode
	MOVR	_mMotorWorkMode,W
	BTRSS	STATUS,2
	MGOTO	_02547_DS_
	BANKSEL	_red_led_blink_cnt
	MOVR	_red_led_blink_cnt,W
	BTRSS	STATUS,2
	MGOTO	_02547_DS_
	.line	1094, "main.c"; 	if (!delaySleepTime)
	BANKSEL	_delaySleepTime
	MOVR	_delaySleepTime,W
	BTRSS	STATUS,2
	MGOTO	_02535_DS_
	.line	1097, "main.c"; 	DISI();
	DISI
	.line	1098, "main.c"; 	INTE = 0x00; // Timer0 overflow interrupt enable bit
	CLRR	_INTE
	.line	1099, "main.c"; 	PCON = 0x18;
	MOVIA	0x18
	MOVAR	_PCON
	.line	1100, "main.c"; 	PORTA = 0x0C;
	MOVIA	0x0c
	MOVAR	_PORTA
	.line	1101, "main.c"; 	PORTB = 0x02;          // PB1 = 1
	MOVIA	0x02
	MOVAR	_PORTB
	.line	1102, "main.c"; 	IOSTA = 0x4E;          // PA5 Input <-- Set PA5 to open drain output
	MOVIA	0x4e
	IOST	_IOSTA
	.line	1103, "main.c"; 	IOSTB = 0x0C;          // PB5 output PB4 Input
	MOVIA	0x0c
	IOST	_IOSTB
	.line	1104, "main.c"; 	AWUCON = C_PA6_Wakeup; //(C_PA5_Wakeup | C_PA4_Wakeup | C_PA0_Wakeup);
	MOVIA	0x40
	MOVAR	_AWUCON
	.line	1105, "main.c"; 	BWUCON = (C_PB3_Wakeup | C_PB2_Wakeup);
	MOVIA	0x0c
	MOVAR	_BWUCON
	.line	1106, "main.c"; 	INTE = C_INT_PABKey; // Enable PortB input change interrupt
	MOVIA	0x02
	MOVAR	_INTE
	.line	1107, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	1108, "main.c"; 	if (0 == P_KEY_M)
	BTRSS	_PORTBbits,3
	MGOTO	_02530_DS_
	.line	1112, "main.c"; 	if (0 == P_KEY_Y)
	BTRSS	_PORTBbits,2
	MGOTO	_02530_DS_
	.line	1116, "main.c"; 	ADMD = C_ADC_CH_Dis | C_Quarter_VDD;
	MOVIA	0x0b
	MOVAR	_ADMD
	.line	1117, "main.c"; 	ADMDbits.GCHS = 0; // disable global ADC channel    (SFR "ADMD")
	BCR	_ADMDbits,4
	.line	1118, "main.c"; 	UPDATE_REG(PORTB);
	MOVR	_PORTB,F
	.line	1119, "main.c"; 	UPDATE_REG(PORTA);
	MOVR	_PORTA,F
	.line	1120, "main.c"; 	NOP();
	nop
	.line	1121, "main.c"; 	SLEEP();
	sleep
_02530_DS_:
	.line	1123, "main.c"; 	INTFbits.PABIF = 0;
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
	.line	1125, "main.c"; 	delaySleepTime = CONST_DELAY_SLEEP_TIME;
	MOVIA	0x14
	BANKSEL	_delaySleepTime
	MOVAR	_delaySleepTime
	.line	1126, "main.c"; 	bFlag_bat_vol_shutdown = 0;
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,6
	.line	1127, "main.c"; 	if (bFlag_bat_vol_low)
	BTRSS	_vFlag_0,5
	MGOTO	_02532_DS_
	.line	1129, "main.c"; 	PCON1 &= 0xE3;                 // 111 0 00 11
	IOSTR	_PCON1
	BANKSEL	r0x103A
	MOVAR	r0x103A
	MOVIA	0xe3
	ANDAR	r0x103A,F
	MOVR	r0x103A,W
	IOST	_PCON1
	.line	1130, "main.c"; 	PCON1 |= (BIT4 | BIT2 | BIT0); // LVDS[2:0] 101 --3.3V
	IOSTR	_PCON1
	MOVAR	r0x103A
	MOVIA	0x15
	IORAR	r0x103A,F
	MOVR	r0x103A,W
	IOST	_PCON1
	MGOTO	_02533_DS_
_02532_DS_:
	.line	1134, "main.c"; 	PCON1 &= 0xE3;                 // 111 0 00 11
	IOSTR	_PCON1
	BANKSEL	r0x103A
	MOVAR	r0x103A
	MOVIA	0xe3
	ANDAR	r0x103A,F
	MOVR	r0x103A,W
	IOST	_PCON1
	.line	1135, "main.c"; 	PCON1 |= (BIT4 | BIT3 | BIT0); // LVDS[2:0] 110 --3.6V
	IOSTR	_PCON1
	MOVAR	r0x103A
	MOVIA	0x19
	IORAR	r0x103A,F
	MOVR	r0x103A,W
	IOST	_PCON1
_02533_DS_:
	.line	1138, "main.c"; 	PCON = 0x98;
	MOVIA	0x98
	MOVAR	_PCON
	.line	1139, "main.c"; 	PCON |= BIT5; // 开启LVD。
	BSR	_PCON,5
	.line	1140, "main.c"; 	INTE = 0x01;  // Timer0 overflow interrupt enable bit
	MOVIA	0x01
	MOVAR	_INTE
	.line	1141, "main.c"; 	ENI();
	ENI
	MGOTO	_02547_DS_
_02535_DS_:
	.line	1145, "main.c"; 	delaySleepTime--;
	BANKSEL	_delaySleepTime
	MOVR	_delaySleepTime,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
	DECR	r0x103A,W
	BANKSEL	_delaySleepTime
	MOVAR	_delaySleepTime
	MGOTO	_02547_DS_
	.line	1151, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1026
;   r0x1027
;; Starting pCode block
.segment "code"; module=main, function=_io_uart_tx
	.debuginfo subprogram _io_uart_tx
;local variable name mapping:
	.debuginfo complex-type (local-sym "_sendByte" 1 "main.c" 924 (basetype 1 unsigned) split "r0x1026")
	.debuginfo complex-type (local-sym "_bCount" 1 "main.c" 927 (basetype 1 unsigned) split "r0x1027")
_io_uart_tx:
; 2 exit points
	.line	924, "main.c"; 	void io_uart_tx(unsigned char sendByte)
	BANKSEL	r0x1026
	MOVAR	r0x1026
	.line	930, "main.c"; 	DISI(); // GIE = 0;
	DISI
	.line	931, "main.c"; 	P_IO_UART_TX_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BCR	r0x1027,4
	MOVR	r0x1027,W
	IOST	_IOSTA
	.line	932, "main.c"; 	P_IO_UART_TX_CLR; // 输出高
	BCR	_PORTAbits,4
	.line	933, "main.c"; 	NOP();
	nop
	.line	934, "main.c"; 	NOP();
	nop
	.line	935, "main.c"; 	NOP();
	nop
	.line	936, "main.c"; 	NOP();
	nop
	.line	937, "main.c"; 	NOP();
	nop
	.line	938, "main.c"; 	NOP();
	nop
	.line	939, "main.c"; 	NOP();
	nop
	.line	940, "main.c"; 	NOP();
	nop
	.line	941, "main.c"; 	NOP();
	nop
	.line	943, "main.c"; 	while (bCount)
	MOVIA	0x08
	BANKSEL	r0x1027
	MOVAR	r0x1027
_02495_DS_:
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BTRSC	STATUS,2
	MGOTO	_02497_DS_
	.line	945, "main.c"; 	if (sendByte & 0x01)
	BANKSEL	r0x1026
	BTRSS	r0x1026,0
	MGOTO	_02493_DS_
	.line	947, "main.c"; 	P_IO_UART_TX_SET; // 输出高
	BSR	_PORTAbits,4
	.line	948, "main.c"; 	NOP();
	nop
	.line	949, "main.c"; 	NOP();
	nop
	MGOTO	_02494_DS_
_02493_DS_:
	.line	953, "main.c"; 	P_IO_UART_TX_CLR; // 输出低
	BCR	_PORTAbits,4
	.line	954, "main.c"; 	NOP();
	nop
	.line	955, "main.c"; 	NOP();
	nop
	.line	956, "main.c"; 	NOP();
	nop
	.line	957, "main.c"; 	NOP();
	nop
	.line	958, "main.c"; 	NOP();
	nop
_02494_DS_:
	.line	960, "main.c"; 	bCount--;
	BANKSEL	r0x1027
	DECR	r0x1027,F
	.line	961, "main.c"; 	sendByte >>= 1;
	BCR	STATUS,0
	BANKSEL	r0x1026
	RRR	r0x1026,F
	MGOTO	_02495_DS_
_02497_DS_:
	.line	964, "main.c"; 	NOP();
	nop
	.line	965, "main.c"; 	P_IO_UART_TX_SET; // 输出高
	BSR	_PORTAbits,4
	.line	966, "main.c"; 	NOP();
	nop
	.line	967, "main.c"; 	NOP();
	nop
	.line	968, "main.c"; 	NOP();
	nop
	.line	969, "main.c"; 	NOP();
	nop
	.line	970, "main.c"; 	NOP();
	nop
	.line	971, "main.c"; 	NOP();
	nop
	.line	972, "main.c"; 	NOP();
	nop
	.line	973, "main.c"; 	NOP();
	nop
	.line	974, "main.c"; 	NOP();
	nop
	.line	975, "main.c"; 	ENI(); // GIE = 1;
	ENI
	.line	976, "main.c"; 	}
	RETURN	
; exit point of _io_uart_tx

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __divuint
;   __divuint
;6 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x1026
;   r0x1027
;   r0x1028
;; Starting pCode block
.segment "code"; module=main, function=_m68_pressure_proc
	.debuginfo subprogram _m68_pressure_proc
;local variable name mapping:
	.debuginfo complex-type (local-sym "_itmp_pressure_level" 1 "main.c" 867 (basetype 1 unsigned) split "r0x1028")
_m68_pressure_proc:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x1F5=501), size=2
	.line	868, "main.c"; 	if (m68Pressure > 500)
	MOVIA	0xf5
	BANKSEL	_m68Pressure
	SUBAR	_m68Pressure,W
	MOVIA	0x01
	SBCAR	(_m68Pressure + 1),W
	BTRSS	STATUS,0
	MGOTO	_02471_DS_
	.line	871, "main.c"; 	mMotorWorkDuty = 100;
	MOVIA	0x64
	BANKSEL	_mMotorWorkDuty
	MOVAR	_mMotorWorkDuty
	CLRR	(_mMotorWorkDuty + 1)
	.line	872, "main.c"; 	mMotorWorkCycle = 100;
	MOVIA	0x64
	BANKSEL	_mMotorWorkCycle
	MOVAR	_mMotorWorkCycle
	CLRR	(_mMotorWorkCycle + 1)
	MGOTO	_02473_DS_
_02471_DS_:
	.line	876, "main.c"; 	itmp_pressure_level = (m68Pressure / 50);
	MOVIA	0x32
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_m68Pressure
	MOVR	_m68Pressure,W
	MOVAR	STK00
	MOVR	(_m68Pressure + 1),W
	MCALL	__divuint
;;100	MOVAR	r0x1026
	MOVR	STK00,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	r0x1028
	MOVAR	r0x1028
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xB=11), size=1
	.line	877, "main.c"; 	if (itmp_pressure_level > 10)
	MOVIA	0x0b
	SUBAR	r0x1028,W
	BTRSS	STATUS,0
	MGOTO	_02456_DS_
	.line	879, "main.c"; 	itmp_pressure_level = 10;
	MOVIA	0x0a
	MOVAR	r0x1028
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xB=11), size=1
_02456_DS_:
	.line	881, "main.c"; 	switch (itmp_pressure_level)
	MOVIA	0x0b
	BANKSEL	r0x1028
	SUBAR	r0x1028,W
	BTRSC	STATUS,0
	MGOTO	_02473_DS_
	MOVIA	((_02487_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1028,W
	ADDIA	_02487_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_02487_DS_:
	MGOTO	_02458_DS_
	MGOTO	_02459_DS_
	MGOTO	_02460_DS_
	MGOTO	_02461_DS_
	MGOTO	_02462_DS_
	MGOTO	_02463_DS_
	MGOTO	_02464_DS_
	MGOTO	_02465_DS_
	MGOTO	_02466_DS_
	MGOTO	_02467_DS_
	MGOTO	_02457_DS_
_02457_DS_:
	.line	885, "main.c"; 	mMotorWorkDuty = 100;
	MOVIA	0x64
	BANKSEL	_mMotorWorkDuty
	MOVAR	_mMotorWorkDuty
	CLRR	(_mMotorWorkDuty + 1)
	.line	886, "main.c"; 	mMotorWorkCycle = 100;
	MOVIA	0x64
	BANKSEL	_mMotorWorkCycle
	MOVAR	_mMotorWorkCycle
	CLRR	(_mMotorWorkCycle + 1)
	.line	887, "main.c"; 	break;
	MGOTO	_02473_DS_
_02458_DS_:
	.line	889, "main.c"; 	yMotorWorkDuty = (yMotorWorkDutyBase + 0);
	BANKSEL	_yMotorWorkDutyBase
	MOVR	_yMotorWorkDutyBase,W
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	890, "main.c"; 	break;
	MGOTO	_02473_DS_
_02459_DS_:
	.line	892, "main.c"; 	yMotorWorkDuty = (yMotorWorkDutyBase + yMotorWorkStep);
	BANKSEL	_yMotorWorkDutyBase
	MOVR	_yMotorWorkDutyBase,W
	BANKSEL	_yMotorWorkStep
	ADDAR	_yMotorWorkStep,W
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	893, "main.c"; 	break;
	MGOTO	_02473_DS_
_02460_DS_:
	.line	895, "main.c"; 	yMotorWorkDuty = (yMotorWorkDutyBase + (yMotorWorkStep << 1)); // x2
	BCR	STATUS,0
	BANKSEL	_yMotorWorkStep
	RLR	_yMotorWorkStep,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	_yMotorWorkDutyBase
	ADDAR	_yMotorWorkDutyBase,W
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	896, "main.c"; 	break;
	MGOTO	_02473_DS_
_02461_DS_:
	.line	898, "main.c"; 	yMotorWorkDuty = (yMotorWorkDutyBase + (yMotorWorkStep << 1) + yMotorWorkStep); // x3
	BCR	STATUS,0
	BANKSEL	_yMotorWorkStep
	RLR	_yMotorWorkStep,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	_yMotorWorkDutyBase
	MOVR	_yMotorWorkDutyBase,W
	BANKSEL	r0x1027
	ADDAR	r0x1027,F
	MOVR	r0x1027,W
	BANKSEL	_yMotorWorkStep
	ADDAR	_yMotorWorkStep,W
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	899, "main.c"; 	break;
	MGOTO	_02473_DS_
_02462_DS_:
	.line	901, "main.c"; 	yMotorWorkDuty = (yMotorWorkDutyBase + (yMotorWorkStep << 2)); // x4
	BCR	STATUS,0
	BANKSEL	_yMotorWorkStep
	RLR	_yMotorWorkStep,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BCR	STATUS,0
	RLR	r0x1027,F
	MOVR	r0x1027,W
	BANKSEL	_yMotorWorkDutyBase
	ADDAR	_yMotorWorkDutyBase,W
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	902, "main.c"; 	break;
	MGOTO	_02473_DS_
_02463_DS_:
	.line	904, "main.c"; 	yMotorWorkDuty = (yMotorWorkDutyBase + (yMotorWorkStep << 2) + yMotorWorkStep); // x5
	BCR	STATUS,0
	BANKSEL	_yMotorWorkStep
	RLR	_yMotorWorkStep,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BCR	STATUS,0
	RLR	r0x1027,F
	BANKSEL	_yMotorWorkDutyBase
	MOVR	_yMotorWorkDutyBase,W
	BANKSEL	r0x1027
	ADDAR	r0x1027,F
	MOVR	r0x1027,W
	BANKSEL	_yMotorWorkStep
	ADDAR	_yMotorWorkStep,W
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	905, "main.c"; 	break;
	MGOTO	_02473_DS_
_02464_DS_:
	.line	907, "main.c"; 	yMotorWorkDuty = (yMotorWorkDutyBase + (yMotorWorkStep << 2) + (yMotorWorkStep << 1)); // x6
	BCR	STATUS,0
	BANKSEL	_yMotorWorkStep
	RLR	_yMotorWorkStep,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BCR	STATUS,0
	RLR	r0x1027,F
	BANKSEL	_yMotorWorkDutyBase
	MOVR	_yMotorWorkDutyBase,W
	BANKSEL	r0x1027
	ADDAR	r0x1027,F
	BCR	STATUS,0
	BANKSEL	_yMotorWorkStep
	RLR	_yMotorWorkStep,W
;;99	MOVAR	r0x1026
	BANKSEL	r0x1027
	ADDAR	r0x1027,W
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	908, "main.c"; 	break;
	MGOTO	_02473_DS_
_02465_DS_:
	.line	910, "main.c"; 	yMotorWorkDuty = (yMotorWorkDutyBase + (yMotorWorkStep << 3) - yMotorWorkStep); // x7
	BCR	STATUS,0
	BANKSEL	_yMotorWorkStep
	RLR	_yMotorWorkStep,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BCR	STATUS,0
	RLR	r0x1027,F
	BCR	STATUS,0
	RLR	r0x1027,F
	BANKSEL	_yMotorWorkDutyBase
	MOVR	_yMotorWorkDutyBase,W
	BANKSEL	r0x1027
	ADDAR	r0x1027,F
	BANKSEL	_yMotorWorkStep
	MOVR	_yMotorWorkStep,W
	BANKSEL	r0x1027
	SUBAR	r0x1027,W
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	911, "main.c"; 	break;
	MGOTO	_02473_DS_
_02466_DS_:
	.line	913, "main.c"; 	yMotorWorkDuty = (yMotorWorkDutyBase + (yMotorWorkStep << 3)); // x8
	BCR	STATUS,0
	BANKSEL	_yMotorWorkStep
	RLR	_yMotorWorkStep,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BCR	STATUS,0
	RLR	r0x1027,F
	BCR	STATUS,0
	RLR	r0x1027,F
	MOVR	r0x1027,W
	BANKSEL	_yMotorWorkDutyBase
	ADDAR	_yMotorWorkDutyBase,W
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	914, "main.c"; 	break;
	MGOTO	_02473_DS_
_02467_DS_:
	.line	916, "main.c"; 	yMotorWorkDuty = (yMotorWorkDutyBase + (yMotorWorkStep << 3) + yMotorWorkStep); // x9
	BCR	STATUS,0
	BANKSEL	_yMotorWorkStep
	RLR	_yMotorWorkStep,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BCR	STATUS,0
	RLR	r0x1027,F
	BCR	STATUS,0
	RLR	r0x1027,F
	BANKSEL	_yMotorWorkDutyBase
	MOVR	_yMotorWorkDutyBase,W
	BANKSEL	r0x1027
	ADDAR	r0x1027,F
	MOVR	r0x1027,W
	BANKSEL	_yMotorWorkStep
	ADDAR	_yMotorWorkStep,W
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
_02473_DS_:
	.line	922, "main.c"; 	}
	RETURN	
; exit point of _m68_pressure_proc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ip53xs_read_nBytes
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _ip53xs_read_nBytes
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;10 compiler assigned registers:
;   r0x1035
;   r0x1036
;   r0x1037
;   STK04
;   STK03
;   STK02
;   STK01
;   STK00
;   r0x1038
;   r0x1039
;; Starting pCode block
.segment "code"; module=main, function=_get_m68_pressure_nbytes
	.debuginfo subprogram _get_m68_pressure_nbytes
;local variable name mapping:
	.debuginfo complex-type (local-sym "_reg_buffer" 4 "main.c" 835 (array 4 (basetype 1 unsigned)) link "_get_m68_pressure_nbytes_reg_buffer_65536_109")
	.debuginfo complex-type (local-sym "_itmp_16bits" 2 "main.c" 836 (basetype 2 unsigned) split "r0x1036" "r0x1037")
_get_m68_pressure_nbytes:
; 2 exit points
	.line	837, "main.c"; 	reg_buffer[0] = 0;
	BANKSEL	_get_m68_pressure_nbytes_reg_buffer_65536_109
	CLRR	(_get_m68_pressure_nbytes_reg_buffer_65536_109 + 0)
	.line	838, "main.c"; 	reg_buffer[1] = 0;
	CLRR	(_get_m68_pressure_nbytes_reg_buffer_65536_109 + 1)
	.line	839, "main.c"; 	reg_buffer[2] = 0;
	CLRR	(_get_m68_pressure_nbytes_reg_buffer_65536_109 + 2)
	.line	840, "main.c"; 	reg_buffer[3] = 0;
	CLRR	(_get_m68_pressure_nbytes_reg_buffer_65536_109 + 3)
	.line	841, "main.c"; 	ip53xs_read_nBytes(&reg_buffer[0], 0xE4, 0x21, 4);
	MOVIA	(_get_m68_pressure_nbytes_reg_buffer_65536_109 + 0)
	BANKSEL	r0x1035
	MOVAR	r0x1035
;;110	CLRR	r0x1036
;;112	CLRR	r0x1037
	MOVIA	0x04
	MOVAR	STK04
	MOVIA	0x21
	MOVAR	STK03
	MOVIA	0xe4
	MOVAR	STK02
	MOVR	r0x1035,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MCALL	_ip53xs_read_nBytes
	.line	842, "main.c"; 	io_uart_tx(0xAA);
	MOVIA	0xaa
	MCALL	_io_uart_tx
	.line	843, "main.c"; 	io_uart_tx(0xAA);
	MOVIA	0xaa
	MCALL	_io_uart_tx
	.line	844, "main.c"; 	io_uart_tx((unsigned char)(reg_buffer[1]));
	BANKSEL	_get_m68_pressure_nbytes_reg_buffer_65536_109
	MOVR	(_get_m68_pressure_nbytes_reg_buffer_65536_109 + 1),W
	BANKSEL	r0x1035
	MOVAR	r0x1035
	MCALL	_io_uart_tx
	.line	845, "main.c"; 	io_uart_tx((unsigned char)(reg_buffer[0]));
	BANKSEL	_get_m68_pressure_nbytes_reg_buffer_65536_109
	MOVR	_get_m68_pressure_nbytes_reg_buffer_65536_109,W
;;6	MOVAR	r0x1035
	MCALL	_io_uart_tx
	.line	846, "main.c"; 	itmp_16bits = reg_buffer[1];
	BANKSEL	_get_m68_pressure_nbytes_reg_buffer_65536_109
	MOVR	(_get_m68_pressure_nbytes_reg_buffer_65536_109 + 1),W
;;6	MOVAR	r0x1035
	BANKSEL	r0x1038
	MOVAR	r0x1038
;;3	MOVAR	r0x1036
;;3	CLRR	r0x1037
;;106	MOVR	r0x1036,W
;;103	CLRR	r0x1035
	.line	848, "main.c"; 	itmp_16bits |= reg_buffer[0];
	BANKSEL	_get_m68_pressure_nbytes_reg_buffer_65536_109
	MOVR	_get_m68_pressure_nbytes_reg_buffer_65536_109,W
;;109	MOVAR	r0x1036
	BANKSEL	_m68Pressure
	MOVAR	_m68Pressure
;;111	MOVAR	r0x1037
;;114	CLRR	r0x1039
;;108	MOVR	r0x1037,W
;;104	IORAR	r0x1035,W
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	_m68Pressure
	MOVAR	(_m68Pressure + 1)
	.line	850, "main.c"; 	io_uart_tx(0xBB);
	MOVIA	0xbb
	MCALL	_io_uart_tx
	.line	851, "main.c"; 	io_uart_tx(0xBB);
	MOVIA	0xbb
	MCALL	_io_uart_tx
	.line	853, "main.c"; 	io_uart_tx((unsigned char)(reg_buffer[3]));
	BANKSEL	_get_m68_pressure_nbytes_reg_buffer_65536_109
	MOVR	(_get_m68_pressure_nbytes_reg_buffer_65536_109 + 3),W
;;6	MOVAR	r0x1035
	MCALL	_io_uart_tx
	.line	854, "main.c"; 	io_uart_tx((unsigned char)(reg_buffer[2]));
	BANKSEL	_get_m68_pressure_nbytes_reg_buffer_65536_109
	MOVR	(_get_m68_pressure_nbytes_reg_buffer_65536_109 + 2),W
;;6	MOVAR	r0x1035
	MCALL	_io_uart_tx
	.line	855, "main.c"; 	itmp_16bits = reg_buffer[3];
	BANKSEL	_get_m68_pressure_nbytes_reg_buffer_65536_109
	MOVR	(_get_m68_pressure_nbytes_reg_buffer_65536_109 + 3),W
;;6	MOVAR	r0x1035
	BANKSEL	r0x1038
	MOVAR	r0x1038
;;3	MOVAR	r0x1036
;;3	CLRR	r0x1037
;;105	MOVR	r0x1036,W
;;101	CLRR	r0x1035
	.line	857, "main.c"; 	itmp_16bits |= reg_buffer[2];
	BANKSEL	_get_m68_pressure_nbytes_reg_buffer_65536_109
	MOVR	(_get_m68_pressure_nbytes_reg_buffer_65536_109 + 2),W
;;6	MOVAR	r0x1036
	BANKSEL	_m68Pressure2
	MOVAR	_m68Pressure2
;;6	MOVAR	r0x1037
;;113	CLRR	r0x1039
;;107	MOVR	r0x1037,W
;;102	IORAR	r0x1035,W
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	_m68Pressure2
	MOVAR	(_m68Pressure2 + 1)
	.line	859, "main.c"; 	io_uart_tx(0xCC);
	MOVIA	0xcc
	MCALL	_io_uart_tx
	.line	860, "main.c"; 	io_uart_tx(0xCC);
	MOVIA	0xcc
	MCALL	_io_uart_tx
	.line	861, "main.c"; 	}
	RETURN	
; exit point of _get_m68_pressure_nbytes

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _i2c_start
;   _i2c_writeByte
;   _i2c_writeByte
;   _i2c_start
;   _i2c_writeByte
;   _i2c_readByte
;   __gptrput1
;   _i2c_send_ack
;   _i2c_readByte
;   __gptrput1
;   _i2c_send_nack
;   _i2c_stop
;   _i2c_start
;   _i2c_writeByte
;   _i2c_writeByte
;   _i2c_start
;   _i2c_writeByte
;   _i2c_readByte
;   __gptrput1
;   _i2c_send_ack
;   _i2c_readByte
;   __gptrput1
;   _i2c_send_nack
;   _i2c_stop
;15 compiler assigned registers:
;   r0x102B
;   STK00
;   r0x102C
;   STK01
;   r0x102D
;   STK02
;   r0x102E
;   STK03
;   r0x102F
;   STK04
;   r0x1030
;   r0x1031
;   r0x1032
;   r0x1033
;   r0x1034
;; Starting pCode block
.segment "code"; module=main, function=_ip53xs_read_nBytes
	.debuginfo subprogram _ip53xs_read_nBytes
;local variable name mapping:
	.debuginfo complex-type (local-sym "_pBuffer" 3 "main.c" 758 (pointer gptr 3 (basetype 1 unsigned)) split "r0x102D" "r0x102C" "r0x102B")
	.debuginfo complex-type (local-sym "_deviceAddr" 1 "main.c" 758 (basetype 1 unsigned) split "r0x102E")
	.debuginfo complex-type (local-sym "_regAddr" 1 "main.c" 758 (basetype 1 unsigned) split "r0x102F")
	.debuginfo complex-type (local-sym "_nbytes" 1 "main.c" 758 (basetype 1 unsigned) split "r0x1030")
	.debuginfo complex-type (local-sym "_itmp" 1 "main.c" 760 (basetype 1 unsigned) split "r0x102E")
_ip53xs_read_nBytes:
; 2 exit points
	.line	758, "main.c"; 	void ip53xs_read_nBytes(unsigned char *pBuffer, unsigned char deviceAddr, unsigned char regAddr, unsigned char nbytes) //(unsigned char regAddr)
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVR	STK00,W
	BANKSEL	r0x102C
	MOVAR	r0x102C
	MOVR	STK01,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
	MOVR	STK02,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVR	STK03,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
	MOVR	STK04,W
	BANKSEL	r0x1030
	MOVAR	r0x1030
	.line	762, "main.c"; 	i2c_start();
	MCALL	_i2c_start
	.line	764, "main.c"; 	if (i2c_writeByte(deviceAddr | IIC_WRITE))
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x1031
	MOVAR	r0x1031
	MOVR	r0x1031,W
	BTRSS	STATUS,2
	MGOTO	_02419_DS_
	.line	769, "main.c"; 	if (i2c_writeByte(regAddr))
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x102F
	MOVAR	r0x102F
	MOVR	r0x102F,W
	BTRSS	STATUS,2
	MGOTO	_02419_DS_
	.line	774, "main.c"; 	i2c_start();
	MCALL	_i2c_start
	.line	776, "main.c"; 	if (i2c_writeByte(deviceAddr | IIC_READ))
	BANKSEL	r0x102E
	BSR	r0x102E,0
	MOVR	r0x102E,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVR	r0x102E,W
	BTRSS	STATUS,2
	MGOTO	_02419_DS_
	.line	781, "main.c"; 	for (itmp = 0; itmp < (nbytes - 1); itmp++) // 连续接收
	CLRR	r0x102E
_02421_DS_:
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BANKSEL	r0x1031
	CLRR	r0x1031
	MOVIA	0xff
	BANKSEL	r0x102F
	ADDAR	r0x102F,F
	MOVIA	0xff
	BANKSEL	r0x1031
	ADCAR	r0x1031,F
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BANKSEL	r0x1032
	MOVAR	r0x1032
;;1	CLRR	r0x1033
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x1034
	MOVAR	r0x1034
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	ADDIA	0x80
	BANKSEL	r0x1034
	SUBAR	r0x1034,W
	BTRSS	STATUS,2
	MGOTO	_02446_DS_
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	BANKSEL	r0x1032
	SUBAR	r0x1032,W
_02446_DS_:
	BTRSC	STATUS,0
	MGOTO	_02418_DS_
	.line	783, "main.c"; 	*pBuffer = i2c_readByte();
	MCALL	_i2c_readByte
	BANKSEL	r0x102F
	MOVAR	r0x102F
	MOVAR	STK02
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	MOVAR	STK01
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK00
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MCALL	__gptrput1
	.line	784, "main.c"; 	pBuffer++;
	BANKSEL	r0x102D
	INCR	r0x102D,F
	BTRSS	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	r0x102C
	INCR	r0x102C,F
_00002_DS_:
	BTRSS	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	r0x102B
	INCR	r0x102B,F
_00003_DS_:
	.line	785, "main.c"; 	i2c_send_ack();
	MCALL	_i2c_send_ack
	.line	781, "main.c"; 	for (itmp = 0; itmp < (nbytes - 1); itmp++) // 连续接收
	BANKSEL	r0x102E
	INCR	r0x102E,F
	MGOTO	_02421_DS_
_02418_DS_:
	.line	788, "main.c"; 	*pBuffer = i2c_readByte();
	MCALL	_i2c_readByte
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVAR	STK02
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	MOVAR	STK01
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK00
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MCALL	__gptrput1
	.line	789, "main.c"; 	i2c_send_nack();
	MCALL	_i2c_send_nack
_02419_DS_:
	.line	792, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	793, "main.c"; 	}
	RETURN	
; exit point of _ip53xs_read_nBytes

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _i2c_start
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_stop
;   _i2c_start
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_stop
;5 compiler assigned registers:
;   r0x103B
;   STK00
;   r0x103C
;   STK01
;   r0x103D
;; Starting pCode block
.segment "code"; module=main, function=_ip53xs_writeByte
	.debuginfo subprogram _ip53xs_writeByte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_deviceAddr" 1 "main.c" 693 (basetype 1 unsigned) split "r0x103B")
	.debuginfo complex-type (local-sym "_regAddr" 1 "main.c" 693 (basetype 1 unsigned) split "r0x103C")
	.debuginfo complex-type (local-sym "_sendByte" 1 "main.c" 693 (basetype 1 unsigned) split "r0x103D")
_ip53xs_writeByte:
; 2 exit points
	.line	693, "main.c"; 	BOOL ip53xs_writeByte(unsigned char deviceAddr, unsigned char regAddr, unsigned char sendByte)
	BANKSEL	r0x103B
	MOVAR	r0x103B
	MOVR	STK00,W
	BANKSEL	r0x103C
	MOVAR	r0x103C
	MOVR	STK01,W
	BANKSEL	r0x103D
	MOVAR	r0x103D
	.line	697, "main.c"; 	i2c_start();
	MCALL	_i2c_start
	.line	699, "main.c"; 	if (i2c_writeByte(deviceAddr | IIC_WRITE))
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x103B
	MOVAR	r0x103B
	MOVR	r0x103B,W
	BTRSC	STATUS,2
	MGOTO	_02402_DS_
	.line	701, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	702, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02407_DS_
_02402_DS_:
	.line	705, "main.c"; 	if (i2c_writeByte(regAddr))
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x103B
	MOVAR	r0x103B
	MOVR	r0x103B,W
	BTRSC	STATUS,2
	MGOTO	_02404_DS_
	.line	707, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	708, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02407_DS_
_02404_DS_:
	.line	711, "main.c"; 	if (i2c_writeByte(sendByte))
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x103B
	MOVAR	r0x103B
	MOVR	r0x103B,W
	BTRSC	STATUS,2
	MGOTO	_02406_DS_
	.line	713, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	714, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02407_DS_
_02406_DS_:
	.line	717, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	720, "main.c"; 	return TRUE;
	MOVIA	0x01
_02407_DS_:
	.line	721, "main.c"; 	}
	RETURN	
; exit point of _ip53xs_writeByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __dly_us
;   __dly_us
;   __dly_us
;   __dly_us
;3 compiler assigned registers:
;   r0x1027
;   r0x1028
;   r0x1029
;; Starting pCode block
.segment "code"; module=main, function=_i2c_readByte
	.debuginfo subprogram _i2c_readByte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_readByte" 1 "main.c" 667 (basetype 1 unsigned) split "r0x1027")
	.debuginfo complex-type (local-sym "_i" 1 "main.c" 666 (basetype 1 unsigned) split "r0x1028")
_i2c_readByte:
; 2 exit points
	.line	667, "main.c"; 	unsigned char readByte = 0;
	BANKSEL	r0x1027
	CLRR	r0x1027
	.line	669, "main.c"; 	P_I2C_SCL_CLR;   // 拉低I2C_SCL
	BCR	_PORTAbits,2
	.line	670, "main.c"; 	P_I2C_SDA_INPUT; // 设置I2C_SDA为输入
	IOSTR	_IOSTA
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BSR	r0x1028,3
	MOVR	r0x1028,W
	IOST	_IOSTA
	.line	672, "main.c"; 	while (i--)
	MOVIA	0x08
	MOVAR	r0x1028
_02394_DS_:
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BANKSEL	r0x1028
	DECR	r0x1028,F
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BTRSC	STATUS,2
	MGOTO	_02396_DS_
	.line	675, "main.c"; 	P_I2C_SCL_SET; // 拉高I2C_SCL
	BSR	_PORTAbits,2
	.line	676, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	677, "main.c"; 	readByte <<= 1;
	BCR	STATUS,0
	BANKSEL	r0x1027
	RLR	r0x1027,F
	.line	679, "main.c"; 	if (P_I2C_SDA)
	BTRSC	_PORTAbits,3
	.line	681, "main.c"; 	readByte |= 0x01;
	BSR	r0x1027,0
	.line	684, "main.c"; 	P_I2C_SCL_CLR; // 拉低I2C_SCL
	BCR	_PORTAbits,2
	.line	685, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	MGOTO	_02394_DS_
_02396_DS_:
	.line	689, "main.c"; 	P_I2C_SDA_OUTPUT; // 设置I2C_SDA为输出
	IOSTR	_IOSTA
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BCR	r0x1028,3
	MOVR	r0x1028,W
	IOST	_IOSTA
	.line	690, "main.c"; 	return readByte;  // 返回数据
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	.line	691, "main.c"; 	}
	RETURN	
; exit point of _i2c_readByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __dly_us
;   __dly_us
;   _i2c_chk_ack
;   __dly_us
;   __dly_us
;   _i2c_chk_ack
;3 compiler assigned registers:
;   r0x1028
;   r0x1029
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_i2c_writeByte
	.debuginfo subprogram _i2c_writeByte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_sendByte" 1 "main.c" 639 (basetype 1 unsigned) split "r0x1028")
	.debuginfo complex-type (local-sym "_i" 1 "main.c" 641 (basetype 1 unsigned) split "r0x1029")
_i2c_writeByte:
; 2 exit points
	.line	639, "main.c"; 	unsigned char i2c_writeByte(unsigned char sendByte)
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	643, "main.c"; 	while (i--) // I2C_SDA脚从高位至低位发送数据
	MOVIA	0x08
	BANKSEL	r0x1029
	MOVAR	r0x1029
_02385_DS_:
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BANKSEL	r0x102A
	MOVAR	r0x102A
	BANKSEL	r0x1029
	DECR	r0x1029,F
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	BTRSC	STATUS,2
	MGOTO	_02387_DS_
	.line	645, "main.c"; 	P_I2C_SCL_CLR; // 拉低I2C_SCL,以允许I2C_SDA脚w位数据发生变化
	BCR	_PORTAbits,2
	.line	646, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	647, "main.c"; 	if (sendByte & 0x80) /* MSB output first */
	BANKSEL	r0x1028
	BTRSS	r0x1028,7
	MGOTO	_02383_DS_
	.line	649, "main.c"; 	P_I2C_SDA_SET;
	BSR	_PORTAbits,3
	MGOTO	_02384_DS_
_02383_DS_:
	.line	653, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
_02384_DS_:
	.line	655, "main.c"; 	sendByte <<= 1;
	BCR	STATUS,0
	BANKSEL	r0x1028
	RLR	r0x1028,F
	.line	656, "main.c"; 	P_I2C_SCL_SET; // 拉高I2C_SCL
	BSR	_PORTAbits,2
	.line	657, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	658, "main.c"; 	NOP();
	nop
	MGOTO	_02385_DS_
_02387_DS_:
	.line	661, "main.c"; 	return i2c_chk_ack();
	MCALL	_i2c_chk_ack
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	662, "main.c"; 	}
	RETURN	
; exit point of _i2c_writeByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __dly_us
;   __dly_us
;   __dly_us
;   __dly_us
;; Starting pCode block
.segment "code"; module=main, function=_i2c_send_nack
	.debuginfo subprogram _i2c_send_nack
_i2c_send_nack:
; 2 exit points
	.line	630, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,2
	.line	631, "main.c"; 	P_I2C_SDA_SET;
	BSR	_PORTAbits,3
	.line	632, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	633, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,2
	.line	634, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	635, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,2
	.line	636, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	637, "main.c"; 	}
	RETURN	
; exit point of _i2c_send_nack

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __dly_us
;   __dly_us
;   __dly_us
;   __dly_us
;; Starting pCode block
.segment "code"; module=main, function=_i2c_send_ack
	.debuginfo subprogram _i2c_send_ack
_i2c_send_ack:
; 2 exit points
	.line	619, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,2
	.line	620, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	621, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	622, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,2
	.line	623, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	624, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,2
	.line	625, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	626, "main.c"; 	}
	RETURN	
; exit point of _i2c_send_ack

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __dly_us
;   __dly_us
;   __dly_us
;   __dly_us
;1 compiler assigned register :
;   r0x1027
;; Starting pCode block
.segment "code"; module=main, function=_i2c_chk_ack
	.debuginfo subprogram _i2c_chk_ack
;local variable name mapping:
	.debuginfo complex-type (local-sym "_getAckTime" 1 "main.c" 598 (basetype 1 unsigned) split "r0x1027")
_i2c_chk_ack:
; 2 exit points
	.line	596, "main.c"; 	P_I2C_SCL_CLR;                                  // slave send ACK
	BCR	_PORTAbits,2
	.line	597, "main.c"; 	P_I2C_SDA_INPUT;                                // Allow slave to send ACK
	IOSTR	_IOSTA
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BSR	r0x1027,3
	MOVR	r0x1027,W
	IOST	_IOSTA
	.line	599, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	600, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,2
	.line	601, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	602, "main.c"; 	while (P_I2C_SDA)
	MOVIA	0xfa
	BANKSEL	r0x1027
	MOVAR	r0x1027
_02366_DS_:
	BTRSS	_PORTAbits,3
	MGOTO	_02368_DS_
	.line	604, "main.c"; 	--getAckTime;
	BANKSEL	r0x1027
	DECRSZ	r0x1027,F
	.line	606, "main.c"; 	if (0 == getAckTime)
	MGOTO	_02366_DS_
	.line	608, "main.c"; 	return 1;
	MOVIA	0x01
	MGOTO	_02369_DS_
_02368_DS_:
	.line	612, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,2
	.line	613, "main.c"; 	P_I2C_SDA_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BCR	r0x1027,3
	MOVR	r0x1027,W
	IOST	_IOSTA
	.line	614, "main.c"; 	return 0;
	MOVIA	0x00
_02369_DS_:
	.line	615, "main.c"; 	}
	RETURN	
; exit point of _i2c_chk_ack

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __dly_us
;   __dly_us
;   __dly_us
;   __dly_us
;; Starting pCode block
.segment "code"; module=main, function=_i2c_stop
	.debuginfo subprogram _i2c_stop
_i2c_stop:
; 2 exit points
	.line	584, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,2
	.line	585, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	586, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	587, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,2
	.line	588, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	589, "main.c"; 	P_I2C_SDA_SET;
	BSR	_PORTAbits,3
	.line	590, "main.c"; 	}
	RETURN	
; exit point of _i2c_stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __dly_us
;   __dly_us
;   __dly_us
;   __dly_us
;1 compiler assigned register :
;   r0x1027
;; Starting pCode block
.segment "code"; module=main, function=_i2c_start
	.debuginfo subprogram _i2c_start
_i2c_start:
; 2 exit points
	.line	571, "main.c"; 	P_I2C_SDA_SET;
	BSR	_PORTAbits,3
	.line	572, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,2
	.line	573, "main.c"; 	P_I2C_SDA_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BCR	r0x1027,3
	MOVR	r0x1027,W
	IOST	_IOSTA
	.line	574, "main.c"; 	P_I2C_SCL_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1027
	BCR	r0x1027,2
	MOVR	r0x1027,W
	IOST	_IOSTA
	.line	575, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	576, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	577, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	578, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,2
	.line	579, "main.c"; 	}
	RETURN	
; exit point of _i2c_start

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _gpioKeyScan
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _gpioKeyScan
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;1 compiler assigned register :
;   r0x102C
;; Starting pCode block
.segment "code"; module=main, function=_Key_Proc
	.debuginfo subprogram _Key_Proc
;local variable name mapping:
	.debuginfo complex-type (local-sym "_imsg" 1 "main.c" 393 (basetype 1 unsigned) split "r0x102C")
_Key_Proc:
; 2 exit points
	.line	394, "main.c"; 	imsg = gpioKeyScan();
	MCALL	_gpioKeyScan
	BANKSEL	r0x102C
	MOVAR	r0x102C
	.line	396, "main.c"; 	switch (imsg)
	XORIA	0x23
	BTRSC	STATUS,2
	MGOTO	_02197_DS_
	MOVR	r0x102C,W
	XORIA	0x24
	BTRSC	STATUS,2
	MGOTO	_02206_DS_
	MOVR	r0x102C,W
	XORIA	0x43
	BTRSC	STATUS,2
	MGOTO	_02218_DS_
	MOVR	r0x102C,W
	XORIA	0x44
	BTRSC	STATUS,2
	MGOTO	_02224_DS_
	MOVR	r0x102C,W
	XORIA	0x45
	BTRSC	STATUS,2
	MGOTO	_02230_DS_
	MGOTO	_02238_DS_
_02197_DS_:
	.line	399, "main.c"; 	if (0 == bFlag_disable_key_func)
	BANKSEL	_vFlag_0
	BTRSC	_vFlag_0,2
	MGOTO	_02238_DS_
	.line	401, "main.c"; 	switch (mMotorWorkMode)
	BANKSEL	_mMotorWorkMode
	MOVR	_mMotorWorkMode,W
	BANKSEL	r0x102C
	MOVAR	r0x102C
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_02198_DS_
	MOVR	r0x102C,W
	XORIA	0x02
	BTRSC	STATUS,2
	MGOTO	_02199_DS_
	MOVR	r0x102C,W
	XORIA	0x03
	BTRSC	STATUS,2
	MGOTO	_02200_DS_
	MOVR	r0x102C,W
	XORIA	0x04
	BTRSC	STATUS,2
	MGOTO	_02201_DS_
	MGOTO	_02238_DS_
_02198_DS_:
	.line	405, "main.c"; 	mMotorWorkMode = 2;
	MOVIA	0x02
	BANKSEL	_mMotorWorkMode
	MOVAR	_mMotorWorkMode
	.line	406, "main.c"; 	mMotorWorkDuty = 70;   // 70%
	MOVIA	0x46
	BANKSEL	_mMotorWorkDuty
	MOVAR	_mMotorWorkDuty
	CLRR	(_mMotorWorkDuty + 1)
	.line	407, "main.c"; 	mMotorWorkCycle = 100; // 对应周期10ms 1%=100us 100%= 10ms
	MOVIA	0x64
	BANKSEL	_mMotorWorkCycle
	MOVAR	_mMotorWorkCycle
	CLRR	(_mMotorWorkCycle + 1)
	.line	408, "main.c"; 	break;
	MGOTO	_02238_DS_
_02199_DS_:
	.line	411, "main.c"; 	mMotorWorkMode = 3;
	MOVIA	0x03
	BANKSEL	_mMotorWorkMode
	MOVAR	_mMotorWorkMode
	.line	412, "main.c"; 	mMotorWorkDuty = 100;  // 100%
	MOVIA	0x64
	BANKSEL	_mMotorWorkDuty
	MOVAR	_mMotorWorkDuty
	CLRR	(_mMotorWorkDuty + 1)
	.line	413, "main.c"; 	mMotorWorkCycle = 100; // 对应周期10ms 1%=100us 100%= 10ms
	MOVIA	0x64
	BANKSEL	_mMotorWorkCycle
	MOVAR	_mMotorWorkCycle
	CLRR	(_mMotorWorkCycle + 1)
	.line	414, "main.c"; 	break;
	MGOTO	_02238_DS_
_02200_DS_:
	.line	417, "main.c"; 	mMotorWorkMode = 4;
	MOVIA	0x04
	BANKSEL	_mMotorWorkMode
	MOVAR	_mMotorWorkMode
	.line	418, "main.c"; 	mMotorWorkDuty = 2000;  // 50% --- 200ms = 2000*100us
	MOVIA	0xd0
	BANKSEL	_mMotorWorkDuty
	MOVAR	_mMotorWorkDuty
	MOVIA	0x07
	MOVAR	(_mMotorWorkDuty + 1)
	.line	419, "main.c"; 	mMotorWorkCycle = 4000; // 对应周期400ms 1%=4ms 100%= 10ms
	MOVIA	0xa0
	BANKSEL	_mMotorWorkCycle
	MOVAR	_mMotorWorkCycle
	MOVIA	0x0f
	MOVAR	(_mMotorWorkCycle + 1)
	.line	420, "main.c"; 	mMotorWorkMode4Cnt = 0;
	BANKSEL	_mMotorWorkMode4Cnt
	CLRR	_mMotorWorkMode4Cnt
	.line	421, "main.c"; 	break;
	MGOTO	_02238_DS_
_02201_DS_:
	.line	424, "main.c"; 	mMotorWorkMode = 1;
	MOVIA	0x01
	BANKSEL	_mMotorWorkMode
	MOVAR	_mMotorWorkMode
	.line	425, "main.c"; 	mMotorWorkDuty = 40;   // 40% = 40*100us = 4ms
	MOVIA	0x28
	BANKSEL	_mMotorWorkDuty
	MOVAR	_mMotorWorkDuty
	CLRR	(_mMotorWorkDuty + 1)
	.line	426, "main.c"; 	mMotorWorkCycle = 100; // 对应周期10ms 1%=100us 100%= 10ms
	MOVIA	0x64
	BANKSEL	_mMotorWorkCycle
	MOVAR	_mMotorWorkCycle
	CLRR	(_mMotorWorkCycle + 1)
	.line	427, "main.c"; 	break;
	MGOTO	_02238_DS_
_02206_DS_:
	.line	435, "main.c"; 	if (0 == bFlag_disable_key_func)
	BANKSEL	_vFlag_0
	BTRSC	_vFlag_0,2
	MGOTO	_02238_DS_
	.line	437, "main.c"; 	switch (yMotorWorkMode)
	BANKSEL	_yMotorWorkMode
	MOVR	_yMotorWorkMode,W
	BANKSEL	r0x102C
	MOVAR	r0x102C
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_02207_DS_
	MOVR	r0x102C,W
	XORIA	0x02
	BTRSC	STATUS,2
	MGOTO	_02208_DS_
	MOVR	r0x102C,W
	XORIA	0x03
	BTRSC	STATUS,2
	MGOTO	_02209_DS_
	MOVR	r0x102C,W
	XORIA	0x04
	BTRSC	STATUS,2
	MGOTO	_02210_DS_
	MOVR	r0x102C,W
	XORIA	0x05
	BTRSC	STATUS,2
	MGOTO	_02211_DS_
	MOVR	r0x102C,W
	XORIA	0x06
	BTRSC	STATUS,2
	MGOTO	_02212_DS_
	MOVR	r0x102C,W
	XORIA	0x07
	BTRSC	STATUS,2
	MGOTO	_02213_DS_
	MGOTO	_02238_DS_
_02207_DS_:
	.line	440, "main.c"; 	io_uart_tx(0x72);
	MOVIA	0x72
	MCALL	_io_uart_tx
	.line	441, "main.c"; 	yMotorWorkMode = 2;
	MOVIA	0x02
	BANKSEL	_yMotorWorkMode
	MOVAR	_yMotorWorkMode
	.line	442, "main.c"; 	yMotorWorkDuty = 80; // 80/200 = 40%
	MOVIA	0x50
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	443, "main.c"; 	yMotorWorkDutyBase = 80;
	BANKSEL	_yMotorWorkDutyBase
	MOVAR	_yMotorWorkDutyBase
	.line	444, "main.c"; 	yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
	MOVIA	0xc8
	BANKSEL	_yMotorWorkCycle
	MOVAR	_yMotorWorkCycle
	.line	445, "main.c"; 	yMotorWorkStep = 12;
	MOVIA	0x0c
	BANKSEL	_yMotorWorkStep
	MOVAR	_yMotorWorkStep
	.line	446, "main.c"; 	break;
	MGOTO	_02238_DS_
_02208_DS_:
	.line	448, "main.c"; 	io_uart_tx(0x73);
	MOVIA	0x73
	MCALL	_io_uart_tx
	.line	449, "main.c"; 	yMotorWorkMode = 3;
	MOVIA	0x03
	BANKSEL	_yMotorWorkMode
	MOVAR	_yMotorWorkMode
	.line	450, "main.c"; 	yMotorWorkDuty = 140; // 140/200 = 70%
	MOVIA	0x8c
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	451, "main.c"; 	yMotorWorkDutyBase = 140;
	BANKSEL	_yMotorWorkDutyBase
	MOVAR	_yMotorWorkDutyBase
	.line	452, "main.c"; 	yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
	MOVIA	0xc8
	BANKSEL	_yMotorWorkCycle
	MOVAR	_yMotorWorkCycle
	.line	453, "main.c"; 	yMotorWorkStep = 6;
	MOVIA	0x06
	BANKSEL	_yMotorWorkStep
	MOVAR	_yMotorWorkStep
	.line	454, "main.c"; 	break;
	MGOTO	_02238_DS_
_02209_DS_:
	.line	456, "main.c"; 	io_uart_tx(0x74);
	MOVIA	0x74
	MCALL	_io_uart_tx
	.line	457, "main.c"; 	yMotorWorkMode = 4;
	MOVIA	0x04
	BANKSEL	_yMotorWorkMode
	MOVAR	_yMotorWorkMode
	.line	458, "main.c"; 	yMotorWorkDuty = 70;   // 70/200 = 35%
	MOVIA	0x46
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	459, "main.c"; 	yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
	MOVIA	0xc8
	BANKSEL	_yMotorWorkCycle
	MOVAR	_yMotorWorkCycle
	.line	460, "main.c"; 	yMotorWorkStep = 0;
	BANKSEL	_yMotorWorkStep
	CLRR	_yMotorWorkStep
	.line	461, "main.c"; 	break;
	MGOTO	_02238_DS_
_02210_DS_:
	.line	463, "main.c"; 	io_uart_tx(0x75);
	MOVIA	0x75
	MCALL	_io_uart_tx
	.line	464, "main.c"; 	yMotorWorkMode = 5;
	MOVIA	0x05
	BANKSEL	_yMotorWorkMode
	MOVAR	_yMotorWorkMode
	.line	465, "main.c"; 	yMotorWorkDuty = 80;   // 80/200 = 40%
	MOVIA	0x50
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	466, "main.c"; 	yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
	MOVIA	0xc8
	BANKSEL	_yMotorWorkCycle
	MOVAR	_yMotorWorkCycle
	.line	467, "main.c"; 	yMotorWorkStep = 0;
	BANKSEL	_yMotorWorkStep
	CLRR	_yMotorWorkStep
	.line	468, "main.c"; 	break;
	MGOTO	_02238_DS_
_02211_DS_:
	.line	470, "main.c"; 	io_uart_tx(0x76);
	MOVIA	0x76
	MCALL	_io_uart_tx
	.line	471, "main.c"; 	yMotorWorkMode = 6;
	MOVIA	0x06
	BANKSEL	_yMotorWorkMode
	MOVAR	_yMotorWorkMode
	.line	472, "main.c"; 	yMotorWorkDuty = 90;   // 90/200 = 45%
	MOVIA	0x5a
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	473, "main.c"; 	yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
	MOVIA	0xc8
	BANKSEL	_yMotorWorkCycle
	MOVAR	_yMotorWorkCycle
	.line	474, "main.c"; 	yMotorWorkStep = 0;
	BANKSEL	_yMotorWorkStep
	CLRR	_yMotorWorkStep
	.line	475, "main.c"; 	break;
	MGOTO	_02238_DS_
_02212_DS_:
	.line	477, "main.c"; 	io_uart_tx(0x77);
	MOVIA	0x77
	MCALL	_io_uart_tx
	.line	478, "main.c"; 	yMotorWorkMode = 7;
	MOVIA	0x07
	BANKSEL	_yMotorWorkMode
	MOVAR	_yMotorWorkMode
	.line	479, "main.c"; 	yMotorWorkDuty = 100;  // 100/200 = 50%
	MOVIA	0x64
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	480, "main.c"; 	yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
	MOVIA	0xc8
	BANKSEL	_yMotorWorkCycle
	MOVAR	_yMotorWorkCycle
	.line	481, "main.c"; 	yMotorWorkStep = 0;
	BANKSEL	_yMotorWorkStep
	CLRR	_yMotorWorkStep
	.line	482, "main.c"; 	break;
	MGOTO	_02238_DS_
_02213_DS_:
	.line	484, "main.c"; 	io_uart_tx(0x78);
	MOVIA	0x78
	MCALL	_io_uart_tx
	.line	485, "main.c"; 	yMotorWorkMode = 1;
	MOVIA	0x01
	BANKSEL	_yMotorWorkMode
	MOVAR	_yMotorWorkMode
	.line	486, "main.c"; 	yMotorWorkDuty = 60; // 60/200 = 30%
	MOVIA	0x3c
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	487, "main.c"; 	yMotorWorkDutyBase = 60;
	BANKSEL	_yMotorWorkDutyBase
	MOVAR	_yMotorWorkDutyBase
	.line	488, "main.c"; 	yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
	MOVIA	0xc8
	BANKSEL	_yMotorWorkCycle
	MOVAR	_yMotorWorkCycle
	.line	489, "main.c"; 	yMotorWorkStep = 14;
	MOVIA	0x0e
	BANKSEL	_yMotorWorkStep
	MOVAR	_yMotorWorkStep
	.line	490, "main.c"; 	break;
	MGOTO	_02238_DS_
_02218_DS_:
	.line	498, "main.c"; 	if (0 == bFlag_disable_key_func)
	BANKSEL	_vFlag_0
	BTRSC	_vFlag_0,2
	MGOTO	_02238_DS_
	.line	500, "main.c"; 	if (mMotorWorkMode)
	BANKSEL	_mMotorWorkMode
	MOVR	_mMotorWorkMode,W
	BTRSC	STATUS,2
	MGOTO	_02220_DS_
	.line	502, "main.c"; 	io_uart_tx(0x60);
	MOVIA	0x60
	MCALL	_io_uart_tx
	.line	503, "main.c"; 	mMotorWorkMode = 0;
	BANKSEL	_mMotorWorkMode
	CLRR	_mMotorWorkMode
	.line	504, "main.c"; 	mMotorWorkDuty = 0;    // 0% = 0*100us = 0ms
	BANKSEL	_mMotorWorkDuty
	CLRR	_mMotorWorkDuty
	CLRR	(_mMotorWorkDuty + 1)
	.line	505, "main.c"; 	mMotorWorkCycle = 100; // 对应周期10ms 1%=100us 100%= 10ms
	MOVIA	0x64
	BANKSEL	_mMotorWorkCycle
	MOVAR	_mMotorWorkCycle
	CLRR	(_mMotorWorkCycle + 1)
	.line	506, "main.c"; 	M_BDCM_OFF;
	BCR	_PORTAbits,0
	MGOTO	_02238_DS_
_02220_DS_:
	.line	510, "main.c"; 	io_uart_tx(0x6F);
	MOVIA	0x6f
	MCALL	_io_uart_tx
	.line	511, "main.c"; 	mMotorWorkMode = 1;
	MOVIA	0x01
	BANKSEL	_mMotorWorkMode
	MOVAR	_mMotorWorkMode
	.line	512, "main.c"; 	mMotorWorkDuty = 40;   // 40% = 40*100us = 4ms
	MOVIA	0x28
	BANKSEL	_mMotorWorkDuty
	MOVAR	_mMotorWorkDuty
	CLRR	(_mMotorWorkDuty + 1)
	.line	513, "main.c"; 	mMotorWorkCycle = 100; // 对应周期10ms 1%=100us 100%= 10ms
	MOVIA	0x64
	BANKSEL	_mMotorWorkCycle
	MOVAR	_mMotorWorkCycle
	CLRR	(_mMotorWorkCycle + 1)
	.line	516, "main.c"; 	break;
	MGOTO	_02238_DS_
_02224_DS_:
	.line	519, "main.c"; 	if (0 == bFlag_disable_key_func)
	BANKSEL	_vFlag_0
	BTRSC	_vFlag_0,2
	MGOTO	_02238_DS_
	.line	521, "main.c"; 	if (yMotorWorkMode)
	BANKSEL	_yMotorWorkMode
	MOVR	_yMotorWorkMode,W
	BTRSC	STATUS,2
	MGOTO	_02226_DS_
	.line	523, "main.c"; 	io_uart_tx(0x70);
	MOVIA	0x70
	MCALL	_io_uart_tx
	.line	524, "main.c"; 	yMotorWorkMode = 0;
	BANKSEL	_yMotorWorkMode
	CLRR	_yMotorWorkMode
	.line	525, "main.c"; 	yMotorWorkDuty = 0;    // 0/200 = 0%
	BANKSEL	_yMotorWorkDuty
	CLRR	_yMotorWorkDuty
	.line	526, "main.c"; 	yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
	MOVIA	0xc8
	BANKSEL	_yMotorWorkCycle
	MOVAR	_yMotorWorkCycle
	.line	527, "main.c"; 	Y_BDCM_OFF;
	BCR	_PORTBbits,0
	.line	528, "main.c"; 	M68_POWER_OFF;
	BSR	_PORTBbits,1
	MGOTO	_02238_DS_
_02226_DS_:
	.line	532, "main.c"; 	io_uart_tx(0x7F);
	MOVIA	0x7f
	MCALL	_io_uart_tx
	.line	533, "main.c"; 	yMotorWorkMode = 1;
	MOVIA	0x01
	BANKSEL	_yMotorWorkMode
	MOVAR	_yMotorWorkMode
	.line	534, "main.c"; 	yMotorWorkDuty = 60; // 60/200 = 30%
	MOVIA	0x3c
	BANKSEL	_yMotorWorkDuty
	MOVAR	_yMotorWorkDuty
	.line	535, "main.c"; 	yMotorWorkDutyBase = 60;
	BANKSEL	_yMotorWorkDutyBase
	MOVAR	_yMotorWorkDutyBase
	.line	536, "main.c"; 	yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
	MOVIA	0xc8
	BANKSEL	_yMotorWorkCycle
	MOVAR	_yMotorWorkCycle
	.line	537, "main.c"; 	yMotorWorkStep = 14;
	MOVIA	0x0e
	BANKSEL	_yMotorWorkStep
	MOVAR	_yMotorWorkStep
	.line	538, "main.c"; 	M68_POWER_ON;
	BCR	_PORTBbits,1
	.line	539, "main.c"; 	delay_op_m68_timer = CONST_DLY_OP_M68_TIMER;
	MOVIA	0x15
	BANKSEL	_delay_op_m68_timer
	MOVAR	_delay_op_m68_timer
	.line	542, "main.c"; 	break;
	MGOTO	_02238_DS_
;;unsigned compare: left < lit(0x4=4), size=1
_02230_DS_:
	.line	545, "main.c"; 	if (red_led_blink_cnt < 4)
	MOVIA	0x04
	BANKSEL	_red_led_blink_cnt
	SUBAR	_red_led_blink_cnt,W
	BTRSC	STATUS,0
	MGOTO	_02232_DS_
	.line	547, "main.c"; 	red_led_blink_cnt = 4;
	MOVIA	0x04
	MOVAR	_red_led_blink_cnt
_02232_DS_:
	.line	549, "main.c"; 	bFlag_light_on = 0;
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,3
	.line	550, "main.c"; 	if (bFlag_disable_key_func)
	BTRSS	_vFlag_0,2
	MGOTO	_02234_DS_
	.line	552, "main.c"; 	io_uart_tx(0xEE);
	MOVIA	0xee
	MCALL	_io_uart_tx
	.line	553, "main.c"; 	bFlag_disable_key_func = 0;
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,2
	MGOTO	_02238_DS_
_02234_DS_:
	.line	557, "main.c"; 	io_uart_tx(0xDD);
	MOVIA	0xdd
	MCALL	_io_uart_tx
	.line	558, "main.c"; 	bFlag_disable_key_func = 1;
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,2
_02238_DS_:
	.line	565, "main.c"; 	}
	RETURN	
; exit point of _Key_Proc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   __muluchar
;   __gptrget1
;   _io_uart_tx
;   __muluchar
;   __gptrget1
;   _io_uart_tx
;   __muluchar
;   __gptrget1
;   _io_uart_tx
;   __muluchar
;   __gptrget1
;   _io_uart_tx
;   __muluchar
;   __gptrget1
;   _io_uart_tx
;   _io_uart_tx
;   _io_uart_tx
;   __muluchar
;   __gptrget1
;   _io_uart_tx
;   __muluchar
;   __gptrget1
;   _io_uart_tx
;   __muluchar
;   __gptrget1
;   _io_uart_tx
;   __muluchar
;   __gptrget1
;   _io_uart_tx
;   __muluchar
;   __gptrget1
;6 compiler assigned registers:
;   r0x1028
;   STK00
;   r0x1029
;   r0x102A
;   STK01
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_gpioKeyScan
	.debuginfo subprogram _gpioKeyScan
;local variable name mapping:
	.debuginfo complex-type (local-sym "_keyIndex" 1 "main.c" 278 (basetype 1 unsigned) split "r0x1028")
	.debuginfo complex-type (local-sym "_prekeyIndex" 1 "main.c" 277 (basetype 1 unsigned) link "_gpioKeyScan_prekeyIndex_65536_43")
_gpioKeyScan:
; 2 exit points
	.line	279, "main.c"; 	if (gpioKeyWaitTimer)
	BANKSEL	_gpioKeyWaitTimer
	MOVR	_gpioKeyWaitTimer,W
	BTRSC	STATUS,2
	MGOTO	_02081_DS_
	.line	281, "main.c"; 	gpioKeyWaitTimer--;
	MOVR	_gpioKeyWaitTimer,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	DECR	r0x1028,W
	BANKSEL	_gpioKeyWaitTimer
	MOVAR	_gpioKeyWaitTimer
_02081_DS_:
	.line	284, "main.c"; 	keyIndex = 0xFF;
	MOVIA	0xff
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	285, "main.c"; 	if (bFlag_Vin_Plug_In)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_02083_DS_
	.line	287, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
	.line	288, "main.c"; 	return MSG_NONE;
	MOVIA	0x00
	MGOTO	_02116_DS_
_02083_DS_:
	.line	291, "main.c"; 	if ((0 == P_KEY_M) && (0 == P_KEY_Y))
	BTRSC	_PORTBbits,3
	MGOTO	_02090_DS_
	BTRSC	_PORTBbits,2
	MGOTO	_02090_DS_
	.line	293, "main.c"; 	keyIndex = 2;
	MOVIA	0x02
	BANKSEL	r0x1028
	MOVAR	r0x1028
	MGOTO	_02091_DS_
_02090_DS_:
	.line	296, "main.c"; 	else if (0 == P_KEY_M)
	BTRSC	_PORTBbits,3
	MGOTO	_02087_DS_
	.line	298, "main.c"; 	keyIndex = 0;
	BANKSEL	r0x1028
	CLRR	r0x1028
	MGOTO	_02091_DS_
_02087_DS_:
	.line	300, "main.c"; 	else if (0 == P_KEY_Y)
	BTRSC	_PORTBbits,2
	MGOTO	_02091_DS_
	.line	302, "main.c"; 	keyIndex = 1;
	MOVIA	0x01
	BANKSEL	r0x1028
	MOVAR	r0x1028
_02091_DS_:
	.line	305, "main.c"; 	switch (gpioKeyState)
	BANKSEL	_gpioKeyState
	MOVR	_gpioKeyState,W
	BTRSC	STATUS,2
	MGOTO	_02093_DS_
	MOVR	_gpioKeyState,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_02096_DS_
	MOVR	_gpioKeyState,W
	XORIA	0x02
	BTRSC	STATUS,2
	MGOTO	_02102_DS_
	MOVR	_gpioKeyState,W
	XORIA	0x03
	BTRSC	STATUS,2
	MGOTO	_02108_DS_
	MGOTO	_02114_DS_
_02093_DS_:
	.line	308, "main.c"; 	if (0xFF == keyIndex)
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	XORIA	0xff
	BTRSS	STATUS,2
	MGOTO	_02095_DS_
	.line	310, "main.c"; 	return MSG_NONE;
	MOVIA	0x00
	MGOTO	_02116_DS_
_02095_DS_:
	.line	313, "main.c"; 	prekeyIndex = keyIndex;
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	_gpioKeyScan_prekeyIndex_65536_43
	MOVAR	_gpioKeyScan_prekeyIndex_65536_43
	.line	314, "main.c"; 	gpioKeyWaitTimer = GPIO_KEY_JTTER_TIME;
	MOVIA	0x03
	BANKSEL	_gpioKeyWaitTimer
	MOVAR	_gpioKeyWaitTimer
	.line	316, "main.c"; 	io_uart_tx(0x51);
	MOVIA	0x51
	MCALL	_io_uart_tx
	.line	317, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_JITTER;
	MOVIA	0x01
	BANKSEL	_gpioKeyState
	MOVAR	_gpioKeyState
_02096_DS_:
	.line	320, "main.c"; 	if (prekeyIndex != keyIndex)
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	_gpioKeyScan_prekeyIndex_65536_43
	XORAR	_gpioKeyScan_prekeyIndex_65536_43,W
	BTRSC	STATUS,2
	MGOTO	_02100_DS_
	.line	323, "main.c"; 	io_uart_tx(0x50);
	MOVIA	0x50
	MCALL	_io_uart_tx
	.line	324, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
	MGOTO	_02115_DS_
_02100_DS_:
	.line	326, "main.c"; 	else if (!gpioKeyWaitTimer)
	BANKSEL	_gpioKeyWaitTimer
	MOVR	_gpioKeyWaitTimer,W
	BTRSS	STATUS,2
	MGOTO	_02115_DS_
	.line	329, "main.c"; 	io_uart_tx(0x52);
	MOVIA	0x52
	MCALL	_io_uart_tx
	.line	330, "main.c"; 	gpioKeyWaitTimer = GPIO_KEY_CP_TIME;
	MOVIA	0x96
	BANKSEL	_gpioKeyWaitTimer
	MOVAR	_gpioKeyWaitTimer
	.line	331, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_PRESS_DOWN;
	MOVIA	0x02
	BANKSEL	_gpioKeyState
	MOVAR	_gpioKeyState
	.line	332, "main.c"; 	return gpioKeyEvent[prekeyIndex][0]; //! PDS(按键开始)
	MOVIA	0x05
	MOVAR	STK00
	BANKSEL	_gpioKeyScan_prekeyIndex_65536_43
	MOVR	_gpioKeyScan_prekeyIndex_65536_43,W
	MCALL	__muluchar
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVR	STK00,W
;;3	MOVAR	r0x102A
	ADDIA	(_gpioKeyEvent + 0)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVIA	((_gpioKeyEvent + 0) >> 8) & 0xff
	BANKSEL	r0x1029
	ADCAR	r0x1029,F
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK01
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;2	MOVAR	r0x102B
	MGOTO	_02116_DS_
_02102_DS_:
	.line	338, "main.c"; 	if (prekeyIndex != keyIndex)
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	_gpioKeyScan_prekeyIndex_65536_43
	XORAR	_gpioKeyScan_prekeyIndex_65536_43,W
	BTRSC	STATUS,2
	MGOTO	_02106_DS_
	.line	341, "main.c"; 	io_uart_tx(0x53);
	MOVIA	0x53
	MCALL	_io_uart_tx
	.line	342, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
	.line	343, "main.c"; 	return gpioKeyEvent[prekeyIndex][1]; //! SPR(短按松开)
	MOVIA	0x05
	MOVAR	STK00
	BANKSEL	_gpioKeyScan_prekeyIndex_65536_43
	MOVR	_gpioKeyScan_prekeyIndex_65536_43,W
	MCALL	__muluchar
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVR	STK00,W
;;3	MOVAR	r0x102A
	ADDIA	(_gpioKeyEvent + 0)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVIA	((_gpioKeyEvent + 0) >> 8) & 0xff
	BANKSEL	r0x1029
	ADCAR	r0x1029,F
	BANKSEL	r0x102A
	INCR	r0x102A,F
	BTRSS	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	r0x1029
	INCR	r0x1029,F
_00004_DS_:
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK01
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;2	MOVAR	r0x102B
	MGOTO	_02116_DS_
_02106_DS_:
	.line	346, "main.c"; 	else if (!gpioKeyWaitTimer)
	BANKSEL	_gpioKeyWaitTimer
	MOVR	_gpioKeyWaitTimer,W
	BTRSS	STATUS,2
	MGOTO	_02115_DS_
	.line	349, "main.c"; 	io_uart_tx(0x54);
	MOVIA	0x54
	MCALL	_io_uart_tx
	.line	350, "main.c"; 	gpioKeyWaitTimer = GPIO_KEY_CPH_TIME;
	MOVIA	0x19
	BANKSEL	_gpioKeyWaitTimer
	MOVAR	_gpioKeyWaitTimer
	.line	351, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_CP;
	MOVIA	0x03
	BANKSEL	_gpioKeyState
	MOVAR	_gpioKeyState
	.line	352, "main.c"; 	return gpioKeyEvent[prekeyIndex][2]; //! CPS(长按开始)
	MOVIA	0x05
	MOVAR	STK00
	BANKSEL	_gpioKeyScan_prekeyIndex_65536_43
	MOVR	_gpioKeyScan_prekeyIndex_65536_43,W
	MCALL	__muluchar
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVR	STK00,W
;;3	MOVAR	r0x102A
	ADDIA	(_gpioKeyEvent + 0)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVIA	((_gpioKeyEvent + 0) >> 8) & 0xff
	BANKSEL	r0x1029
	ADCAR	r0x1029,F
	MOVIA	0x02
	BANKSEL	r0x102A
	ADDAR	r0x102A,F
	MOVIA	0x00
	BANKSEL	r0x1029
	ADCAR	r0x1029,F
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK01
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;2	MOVAR	r0x102B
	MGOTO	_02116_DS_
_02108_DS_:
	.line	358, "main.c"; 	if (prekeyIndex != keyIndex)
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	_gpioKeyScan_prekeyIndex_65536_43
	XORAR	_gpioKeyScan_prekeyIndex_65536_43,W
	BTRSC	STATUS,2
	MGOTO	_02112_DS_
	.line	361, "main.c"; 	io_uart_tx(0x55);
	MOVIA	0x55
	MCALL	_io_uart_tx
	.line	362, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
	.line	363, "main.c"; 	return gpioKeyEvent[prekeyIndex][4]; //! CPR(长按松开)
	MOVIA	0x05
	MOVAR	STK00
	BANKSEL	_gpioKeyScan_prekeyIndex_65536_43
	MOVR	_gpioKeyScan_prekeyIndex_65536_43,W
	MCALL	__muluchar
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVR	STK00,W
;;3	MOVAR	r0x1028
	ADDIA	(_gpioKeyEvent + 0)
	BANKSEL	r0x1028
	MOVAR	r0x1028
	MOVIA	((_gpioKeyEvent + 0) >> 8) & 0xff
	BANKSEL	r0x102A
	ADCAR	r0x102A,F
	MOVIA	0x04
	BANKSEL	r0x1028
	ADDAR	r0x1028,F
	MOVIA	0x00
	BANKSEL	r0x102A
	ADCAR	r0x102A,F
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK01
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MGOTO	_02116_DS_
_02112_DS_:
	.line	366, "main.c"; 	else if (!gpioKeyWaitTimer)
	BANKSEL	_gpioKeyWaitTimer
	MOVR	_gpioKeyWaitTimer,W
	BTRSS	STATUS,2
	MGOTO	_02115_DS_
	.line	369, "main.c"; 	io_uart_tx(0x56);
	MOVIA	0x56
	MCALL	_io_uart_tx
	.line	370, "main.c"; 	gpioKeyWaitTimer = GPIO_KEY_CPH_TIME;
	MOVIA	0x19
	BANKSEL	_gpioKeyWaitTimer
	MOVAR	_gpioKeyWaitTimer
	.line	371, "main.c"; 	return gpioKeyEvent[prekeyIndex][3]; //! CPH (长按保持)
	MOVIA	0x05
	MOVAR	STK00
	BANKSEL	_gpioKeyScan_prekeyIndex_65536_43
	MOVR	_gpioKeyScan_prekeyIndex_65536_43,W
	MCALL	__muluchar
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVR	STK00,W
;;3	MOVAR	r0x1028
	ADDIA	(_gpioKeyEvent + 0)
	BANKSEL	r0x1028
	MOVAR	r0x1028
	MOVIA	((_gpioKeyEvent + 0) >> 8) & 0xff
	BANKSEL	r0x102A
	ADCAR	r0x102A,F
	MOVIA	0x03
	BANKSEL	r0x1028
	ADDAR	r0x1028,F
	MOVIA	0x00
	BANKSEL	r0x102A
	ADCAR	r0x102A,F
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK01
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MGOTO	_02116_DS_
_02114_DS_:
	.line	378, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
_02115_DS_:
	.line	382, "main.c"; 	return MSG_NONE;
	MOVIA	0x00
_02116_DS_:
	.line	383, "main.c"; 	}
	RETURN	
; exit point of _gpioKeyScan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _io_uart_tx
;   _io_uart_tx
;1 compiler assigned register :
;   r0x1028
;; Starting pCode block
.segment "code"; module=main, function=_get_bat_vol
	.debuginfo subprogram _get_bat_vol
;local variable name mapping:
	.debuginfo complex-type (local-sym "_counter" 1 "main.c" 233 (basetype 1 unsigned) link "_get_bat_vol_counter_65536_32")
_get_bat_vol:
; 2 exit points
	.line	235, "main.c"; 	if (0 == bFlag_bat_vol_low)
	BANKSEL	_vFlag_0
	BTRSC	_vFlag_0,5
	MGOTO	_02073_DS_
	.line	237, "main.c"; 	if (0 == (PCON1 & BIT6)) //
	IOSTR	_PCON1
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BTRSC	r0x1028,6
	MGOTO	_02063_DS_
	.line	239, "main.c"; 	if (++counter > CONST_VIN_FILTER)
	BANKSEL	_get_bat_vol_counter_65536_32
	INCR	_get_bat_vol_counter_65536_32,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x10=16), size=1
	MOVIA	0x10
	SUBAR	_get_bat_vol_counter_65536_32,W
	BTRSS	STATUS,0
	MGOTO	_02075_DS_
	.line	241, "main.c"; 	bFlag_bat_vol_low = 1; //
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,5
;;unsigned compare: left < lit(0xC=12), size=1
	.line	242, "main.c"; 	if (red_led_blink_cnt < 12)
	MOVIA	0x0c
	BANKSEL	_red_led_blink_cnt
	SUBAR	_red_led_blink_cnt,W
	BTRSC	STATUS,0
	MGOTO	_02059_DS_
	.line	244, "main.c"; 	red_led_blink_cnt = 12;
	MOVIA	0x0c
	MOVAR	_red_led_blink_cnt
_02059_DS_:
	.line	246, "main.c"; 	bFlag_light_on = 0;
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,3
	.line	247, "main.c"; 	PCON1 &= 0xE3;          // 111 0 00 11
	IOSTR	_PCON1
	BANKSEL	r0x1028
	MOVAR	r0x1028
	MOVIA	0xe3
	ANDAR	r0x1028,F
	MOVR	r0x1028,W
	IOST	_PCON1
	.line	248, "main.c"; 	PCON1 |= (BIT4 | BIT2); // LVDS[2:0] 101 --3.3V
	IOSTR	_PCON1
	MOVAR	r0x1028
	MOVIA	0x14
	IORAR	r0x1028,F
	MOVR	r0x1028,W
	IOST	_PCON1
	MGOTO	_02075_DS_
_02063_DS_:
	.line	253, "main.c"; 	counter = 0;
	BANKSEL	_get_bat_vol_counter_65536_32
	CLRR	_get_bat_vol_counter_65536_32
	MGOTO	_02075_DS_
_02073_DS_:
	.line	256, "main.c"; 	else if (0 == bFlag_bat_vol_shutdown)
	BANKSEL	_vFlag_0
	BTRSC	_vFlag_0,6
	MGOTO	_02075_DS_
	.line	258, "main.c"; 	if (0 == (PCON1 & BIT6))
	IOSTR	_PCON1
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BTRSC	r0x1028,6
	MGOTO	_02068_DS_
	.line	260, "main.c"; 	if (++counter > CONST_VIN_FILTER)
	BANKSEL	_get_bat_vol_counter_65536_32
	INCR	_get_bat_vol_counter_65536_32,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x10=16), size=1
	MOVIA	0x10
	SUBAR	_get_bat_vol_counter_65536_32,W
	BTRSS	STATUS,0
	MGOTO	_02075_DS_
	.line	262, "main.c"; 	io_uart_tx(0x44);
	MOVIA	0x44
	MCALL	_io_uart_tx
	.line	263, "main.c"; 	bFlag_bat_vol_shutdown = 1; //
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,6
	.line	264, "main.c"; 	red_led_blink_cnt = 90;
	MOVIA	0x5a
	BANKSEL	_red_led_blink_cnt
	MOVAR	_red_led_blink_cnt
	.line	265, "main.c"; 	bFlag_light_on = 0;
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,3
	MGOTO	_02075_DS_
_02068_DS_:
	.line	270, "main.c"; 	counter = 0;
	BANKSEL	_get_bat_vol_counter_65536_32
	CLRR	_get_bat_vol_counter_65536_32
_02075_DS_:
	.line	273, "main.c"; 	}
	RETURN	
; exit point of _get_bat_vol

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_get_vin_status
	.debuginfo subprogram _get_vin_status
;local variable name mapping:
	.debuginfo complex-type (local-sym "_counter" 1 "main.c" 184 (basetype 1 unsigned) link "_get_vin_status_counter_65536_22")
_get_vin_status:
; 2 exit points
	.line	185, "main.c"; 	P_VIN_INPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BSR	r0x1026,6
	MOVR	r0x1026,W
	IOST	_IOSTA
	.line	187, "main.c"; 	if (bFlag_Vin_Plug_In)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_02051_DS_
	.line	189, "main.c"; 	if (!P_VIN)
	BTRSC	_PORTAbits,6
	MGOTO	_02043_DS_
	.line	191, "main.c"; 	if (++counter > CONST_VIN_FILTER)
	BANKSEL	_get_vin_status_counter_65536_22
	INCR	_get_vin_status_counter_65536_22,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x10=16), size=1
	MOVIA	0x10
	SUBAR	_get_vin_status_counter_65536_22,W
	BTRSS	STATUS,0
	MGOTO	_02053_DS_
	.line	193, "main.c"; 	bFlag_Vin_Plug_In = 0;
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,4
	MGOTO	_02053_DS_
_02043_DS_:
	.line	198, "main.c"; 	counter = 0;
	BANKSEL	_get_vin_status_counter_65536_22
	CLRR	_get_vin_status_counter_65536_22
	MGOTO	_02053_DS_
_02051_DS_:
	.line	203, "main.c"; 	if (P_VIN)
	BTRSS	_PORTAbits,6
	MGOTO	_02048_DS_
	.line	205, "main.c"; 	if (++counter > CONST_VIN_FILTER)
	BANKSEL	_get_vin_status_counter_65536_22
	INCR	_get_vin_status_counter_65536_22,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x10=16), size=1
	MOVIA	0x10
	SUBAR	_get_vin_status_counter_65536_22,W
	BTRSS	STATUS,0
	MGOTO	_02053_DS_
	.line	207, "main.c"; 	bFlag_Vin_Plug_In = 1; //
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,4
	.line	208, "main.c"; 	bFlag_bat_vol_low = 0;
	BCR	_vFlag_0,5
	.line	209, "main.c"; 	bFlag_bat_vol_shutdown = 0;
	BCR	_vFlag_0,6
	.line	210, "main.c"; 	PCON1 &= 0xE3;          // 111 0 00 11
	IOSTR	_PCON1
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVIA	0xe3
	ANDAR	r0x1026,F
	MOVR	r0x1026,W
	IOST	_PCON1
	.line	211, "main.c"; 	PCON1 |= (BIT4 | BIT3); // LVDS[2:0] 110 --3.6V
	IOSTR	_PCON1
	MOVAR	r0x1026
	MOVIA	0x18
	IORAR	r0x1026,F
	MOVR	r0x1026,W
	IOST	_PCON1
	.line	212, "main.c"; 	yMotorWorkMode = 0;
	BANKSEL	_yMotorWorkMode
	CLRR	_yMotorWorkMode
	.line	213, "main.c"; 	yMotorWorkDuty = 0;    // 0/200 = 0%
	BANKSEL	_yMotorWorkDuty
	CLRR	_yMotorWorkDuty
	.line	214, "main.c"; 	yMotorWorkCycle = 200; // 对应周期20ms = 200*100us
	MOVIA	0xc8
	BANKSEL	_yMotorWorkCycle
	MOVAR	_yMotorWorkCycle
	.line	215, "main.c"; 	Y_BDCM_OFF;
	BCR	_PORTBbits,0
	.line	216, "main.c"; 	M68_POWER_OFF;
	BSR	_PORTBbits,1
	.line	217, "main.c"; 	mMotorWorkMode = 0;
	BANKSEL	_mMotorWorkMode
	CLRR	_mMotorWorkMode
	.line	218, "main.c"; 	mMotorWorkDuty = 0;    // 0% = 0*100us = 0ms
	BANKSEL	_mMotorWorkDuty
	CLRR	_mMotorWorkDuty
	CLRR	(_mMotorWorkDuty + 1)
	.line	219, "main.c"; 	mMotorWorkCycle = 100; // 对应周期10ms 1%=100us 100%= 10ms
	MOVIA	0x64
	BANKSEL	_mMotorWorkCycle
	MOVAR	_mMotorWorkCycle
	CLRR	(_mMotorWorkCycle + 1)
	.line	220, "main.c"; 	M_BDCM_OFF;
	BCR	_PORTAbits,0
	.line	221, "main.c"; 	bFlag_bat_vol_shutdown = 0;
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,6
	MGOTO	_02053_DS_
_02048_DS_:
	.line	226, "main.c"; 	counter = 0;
	BANKSEL	_get_vin_status_counter_65536_22
	CLRR	_get_vin_status_counter_65536_22
_02053_DS_:
	.line	229, "main.c"; 	}
	RETURN	
; exit point of _get_vin_status

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=__dly_us
	.debuginfo subprogram __dly_us
__dly_us:
; 2 exit points
	.line	173, "main.c"; 	void _dly_us(unsigned char cnt)
	BANKSEL	r0x1026
	MOVAR	r0x1026
_02032_DS_:
	.line	175, "main.c"; 	while (cnt)
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BTRSC	STATUS,2
	MGOTO	_02035_DS_
	.line	177, "main.c"; 	cnt--;
	DECR	r0x1026,F
	MGOTO	_02032_DS_
_02035_DS_:
	.line	179, "main.c"; 	}
	RETURN	
; exit point of __dly_us


;	code size estimation:
;	 1431+  421 =  1852 instructions ( 4546 byte)

	end
