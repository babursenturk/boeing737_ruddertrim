  ROM 43% full. 6910 bytes used (does not include absolute areas).
  RAM 46% full. 360 bytes used (does not include stack usage).

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   01A2 =    418. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  _CG
       0342  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   0342   0002 =      2. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0342  __func_lit_start
       0344  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   0344   0202 =    514. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0344  LoadConfigTBL_radyopnl
       0533  LoadConfigInit
       0533  _LoadConfigInit
       0540  LoadConfig_radyopnl
       0540  _LoadConfig_radyopnl
       0546  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   0546   04FD =   1277. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0546  _LCD_1_PrCString
       0546  LCD_1_PrCString
       0558  LCD_1_HEX_STR
       0568  _LCD_1_PrHexByte
       0568  LCD_1_PrHexByte
       057B  LCD_1_PrHexInt
       057B  _LCD_1_PrHexInt
       0582  LCD_1_PrString
       0582  _LCD_1_PrString
       0594  LCD_1_Write_Data
       0594  _LCD_1_WriteData
       0594  LCD_1_WriteData
       0594  _LCD_1_Write_Data
       05A8  LCD_1_Control
       05A8  _LCD_1_Control
       0651  _LCD_1_Start
       0651  LCD_1_Start
       0651  LCD_1_Init
       0651  _LCD_1_Init
       06C0  LCD_1_ROW_OFFSET
       06C4  _LCD_1_Position
       06C4  LCD_1_Position
       06D4  _LCD_1_Delay50uTimes
       06D4  LCD_1_Delay50uTimes
       06DA  LCD_1_Delay50u_Table
       06E2  LCD_1_Delay50u
       06E2  _LCD_1_Delay50u
       06F6  _LCD_1_DrawBG
       0723  _LCD_1_DrawVBG
       0757  LCD_1_InitVBG
       0757  _LCD_1_InitVBG
       0788  LCD_1_BG_TYPE1
       078F  LCD_1_BG_TYPE2
       0796  _LCD_1_InitBG
       0796  LCD_1_InitBG
       07CA  I2CHW_1_Start
       07CA  _I2CHW_1_Start
       07CB  _I2CHW_1_EnableInt
       07CB  I2CHW_1_EnableInt
       07D7  _I2CHW_1_EnableMstr
       07D7  I2CHW_1_EnableMstr
       07DB  _I2CHW_1_EnableSlave
       07DB  I2CHW_1_EnableSlave
       07DF  _I2CHW_1_Stop
       07DF  _I2CHW_1_DisableInt
       07DF  I2CHW_1_Stop
       07DF  I2CHW_1_DisableInt
       07E3  _I2CHW_1_DisableSlave
       07E3  I2CHW_1_DisableSlave
       07E7  I2CHW_1_DisableMstr
       07E7  _I2CHW_1_DisableMstr
       07EB  _I2CHW_1_Poll
       07EB  I2CHW_1_Poll
       07EC  _I2CHW_1_ISR
       0902  _I2CHW_1_InitWrite
       0902  I2CHW_1_InitWrite
       0940  I2CHW_1_InitRamRead
       0940  _I2CHW_1_InitRamRead
       096D  I2CHW_1_InitFlashRead
       096D  _I2CHW_1_InitFlashRead
       096E  _I2CHW_1_bReadI2CStatus
       096E  I2CHW_1_bReadI2CStatus
       0974  _I2CHW_1_ClrRdStatus
       0974  I2CHW_1_ClrRdStatus
       097B  _I2CHW_1_ClrWrStatus
       097B  I2CHW_1_ClrWrStatus
       0982  Counter8_1_EnableInt
       0982  _Counter8_1_EnableInt
       0986  _Counter8_1_DisableInt
       0986  Counter8_1_DisableInt
       098A  Counter8_1_Start
       098A  _Counter8_1_Start
       098E  _Counter8_1_Stop
       098E  Counter8_1_Stop
       0992  Counter8_1_WritePeriod
       0992  _Counter8_1_WritePeriod
       0995  Counter8_1_WriteCompareValue
       0995  _Counter8_1_WriteCompareValue
       0998  _bCounter8_1_ReadCompareValue
       0998  _Counter8_1_bReadCompareValue
       0998  Counter8_1_bReadCompareValue
       0998  bCounter8_1_ReadCompareValue
       099B  _Counter8_1_bReadCounter
       099B  _bCounter8_1_ReadCounter
       099B  Counter8_1_bReadCounter
       099B  bCounter8_1_ReadCounter
       09CC  _ADCINC12_1_CNT_ISR
       09CF  _ADCINC12_1_TMR_ISR
       0A43  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0A43   125B =   4699. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0A43  __text_start
       0A43  _Counter8_1_ISR
       0AEB  _encoder_isr
       0AEC  _init_environment
       0B28  _init_cgram
       0D5B  _init_delay_counter
       0D81  _main
       0E9D  _dly
       0F00  _I2Yaz
       0F23  _I2Oku
       0F46  _clrdisp
       0F6A  _disp_msg
       0F85  _LCD_PrintInt
       0FB0  _LCD_PrintFloat
       1069  __divmod_32X32_32
       10A6  __divmodu_16X16_16
       10B1  __divmodu_32X32_32
       10C0  __divmodu_8X8_8
       10D8  __F_analysisEject_util
       10E3  __F_Round_util
       10F9  __F_Normal_util
       1104  __F_clrReg_util
       110F  __F_NaN_Res_util
       111B  __F_SaveRes_util
       1138  __F_SendToReg_util
       1149  __F_sInf_Res_util
       1156  __F_sZero_Res_util
       115E  __F_Type_Oprnd_util
       117D  __F_Unnormal_util
       1193  __fpadd
       1293  __fpcmp
       12F0  __i_div16_block_util
       1329  __i_div32_block_util
       138C  __i_div32_not_util
       13A4  __i_div8_block_util
       13BD  __mul16
       13FB  _ftoa
       184C  _itoa
       1A25  _ltoa
       1C9E  __text_end
       1D00  __xidata_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0068   0138 =    312. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       0135  bGetPowerSetting
       0135  _bGetPowerSetting

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0000   0011 =     17. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  Port_0_Data_SHADE
       0000  _NO_SHADOW
       0000  _Port_0_Data_SHADE
       0000  NO_SHADOW
       0001  _Port_0_DriveMode_0_SHADE
       0001  Port_0_DriveMode_0_SHADE
       0002  Port_0_DriveMode_1_SHADE
       0002  _Port_0_DriveMode_1_SHADE
       0003  _I2CHW_1_bStatus
       0003  I2CHW_1_bStatus
       0004  _I2CHW_1_RsrcStatus
       0004  I2CHW_1_RsrcStatus
       0005  I2CHW_1_Write_Count
       0005  _I2CHW_1_Write_Count
       0006  _pI2CHW_1_Write_BufHI
       0006  pI2CHW_1_Write_BufHI
       0007  _pI2CHW_1_Write_Buf
       0007  pI2CHW_1_Write_Buf
       0007  pI2CHW_1_Write_BufLO
       0007  _pI2CHW_1_Write_BufLO
       0008  _pI2CHW_1_Read_BufHI
       0008  pI2CHW_1_Read_BufHI
       0009  _pI2CHW_1_Read_BufLO
       0009  pI2CHW_1_Read_Buf
       0009  pI2CHW_1_Read_BufLO
       0009  _pI2CHW_1_Read_Buf
       000A  _I2CHW_1_Read_Count
       000A  I2CHW_1_Read_Count
       000B  ADCINC12_1_cTimerU
       000C  ADCINC12_1_cCounterU
       000D  ADCINC12_1_iIncr
       000D  _ADCINC12_1_iIncr
       000F  ADCINC12_1_fIncr
       000F  _ADCINC12_1_fIncr
       0010  ADCINC12_1_bIncrC

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0134   000F =     15. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0134  __rZ
       0135  __rY
       0136  __rX
       0137  __r11
       0138  __r10
       0139  __r9
       013A  __r8
       013B  __r7
       013C  __r6
       013D  __r5
       013E  __r4
       013F  __r3
       0140  __r2
       0141  __r1
       0142  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0148 =    328. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0011  _mevcut
       0051  _dummy
       0091  _COM_DEC
       00B9  _rxBuffer
       00D9  _txBuffer
       00F9  _ekran_res
       00FD  _Timeout_d
       00FF  _dummy1
       0100  _COM_INT
       0113  _TABELA
       0124  _adc_res
       0152  _intRet
       015A  _STATUS
       015C  _acnt
       015E  _cnt
       0160  _ptr
       0162  _lastport
       0163  _sag_decisim
       0164  _sag_intkisim
       0165  _status
       0166  _sol_decisim
       0167  _sol_intkisim

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ psocconfigtbl.asm, psocconfig.asm, lcd_1.asm, i2chw_1rsrcinits.asm, i2chw_1int.asm, i2chw_1common.asm ]
[ counter8_1.asm, adcinc12_1int.asm, rZ.asm, rY.asm, rX.asm, r11.asm, r10.asm, r9.asm, r8.asm, r7.asm ]
[ r6.asm, r5.asm, r4.asm, r3.asm, r2.asm, r1.asm, r0.asm, divmod_32x32_32_util.asm, divmodu_16x16_16_util.asm ]
[ divmodu_32x32_32_util.asm, divmodu_8x8_8_util.asm, fp_analysiseject_util.asm, fp_clrreg_util.asm ]
[ fp_nan_res_util.asm, fp_saveres_util.asm, fp_sendtoreg_util.asm, fp_sinf_res_util.asm, fp_szero_res_util.asm ]
[ fp_type_oprnd_util.asm, fp_unnormal_util.asm, fpadd_util.asm, fpcmp_util.asm, i_div16_block_util.asm ]
[ i_div32_block_util.asm, i_div32_not_util.asm, i_div8_block_util.asm, mul16_util.asm, ftoa.s ]
[ itoa.s, ltoa.s ]

User Base Address Definitions

lit = 0x1a0
data = 0x0
SSCParmBlk:0x00F7.0x00FF
InterruptRAM = 0x0
virtual_registers = 0x134
radyopnl_RAM = 0x168

