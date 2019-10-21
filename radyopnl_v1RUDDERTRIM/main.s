	cpu LMM
	.module main.c
	.area data(ram, con, rel)
_STATUS::
	.word 0
	.dbfile ./hbheader.h
	.dbsym e STATUS _STATUS I
	.area data(ram, con, rel)
	.dbfile ./hbheader.h
	.area data(ram, con, rel)
	.dbfile ./hbheader.h
_COM_INT::
	.byte 18,19
	.byte 20,21
	.byte 22,23
	.byte 24,25
	.byte 26,27
	.byte 28,29
	.byte 30,31
	.byte 32,33
	.byte 34,35
	.byte 36
	.dbsym e COM_INT _COM_INT A[19:19]c
	.area data(ram, con, rel)
	.dbfile ./hbheader.h
	.area data(ram, con, rel)
	.dbfile ./hbheader.h
_COM_DEC::
	.byte 0,2
	.byte 5,7
	.byte 10,12
	.byte 15,17
	.byte 20,22
	.byte 25,27
	.byte 30,32
	.byte 35,37
	.byte 40,42
	.byte 45,47
	.byte 50,52
	.byte 55,57
	.byte 60,62
	.byte 'A,'C
	.byte 'F,'H
	.byte 'K,'M
	.byte 'P,'R
	.byte 'U,'W
	.byte 'Z,92
	.byte 95,'a
	.dbsym e COM_DEC _COM_DEC A[40:40]c
	.area data(ram, con, rel)
	.dbfile ./hbheader.h
	.area data(ram, con, rel)
	.dbfile ./hbheader.h
_adc_res::
	.byte 0
	.word 0,0,0,0,0
	.byte 0,0,0,0,0
	.dbfile ./main.c
	.dbsym e adc_res _adc_res A[16:16]c
	.area data(ram, con, rel)
	.dbfile ./main.c
	.area data(ram, con, rel)
	.dbfile ./main.c
_ekran_res::
	.byte 0
	.byte 0,0,0
	.dbsym e ekran_res _ekran_res A[4:4]c
	.area data(ram, con, rel)
	.dbfile ./main.c
	.area data(ram, con, rel)
	.dbfile ./main.c
_sol_intkisim::
	.byte 0
	.dbsym e sol_intkisim _sol_intkisim c
	.area data(ram, con, rel)
	.dbfile ./main.c
	.area data(ram, con, rel)
	.dbfile ./main.c
_sol_decisim::
	.byte 0
	.dbsym e sol_decisim _sol_decisim c
	.area data(ram, con, rel)
	.dbfile ./main.c
	.area data(ram, con, rel)
	.dbfile ./main.c
_sag_intkisim::
	.byte 0
	.dbsym e sag_intkisim _sag_intkisim c
	.area data(ram, con, rel)
	.dbfile ./main.c
	.area data(ram, con, rel)
	.dbfile ./main.c
_sag_decisim::
	.byte 0
	.dbsym e sag_decisim _sag_decisim c
	.area data(ram, con, rel)
	.dbfile ./main.c
	.area data(ram, con, rel)
	.dbfile ./main.c
_TABELA::
	.byte 32,32,6,1,2,2,3,6,32,32,4,6,7,5,32,32
	.byte 0
	.dbsym e TABELA _TABELA A[17:17]c
	.area data(ram, con, rel)
	.dbfile ./main.c
	.area text(rom, con, rel)
	.dbfile ./main.c
	.dbfunc e Counter8_1_ISR _Counter8_1_ISR fV
_Counter8_1_ISR::
	.dbline -1
	or F,-64
	push A
	mov A,REG[0xd0]
	push A
	mov A,REG[0xd3]
	push A
	mov A,REG[0xd4]
	push A
	mov A,REG[0xd5]
	push A
	mov REG[0xd0],>__r0
	mov A,[__r0]
	push A
	mov A,[__r1]
	push A
	mov A,[__r2]
	push A
	mov A,[__r3]
	push A
	mov A,[__r4]
	push A
	mov A,[__r5]
	push A
	mov A,[__r6]
	push A
	mov A,[__r7]
	push A
	mov A,[__r8]
	push A
	mov A,[__r9]
	push A
	mov A,[__r10]
	push A
	mov A,[__r11]
	push A
	mov A,[__rX]
	push A
	mov A,[__rY]
	push A
	mov A,[__rZ]
	push A
	.dbline 40
; //----------------------------------------------------------------------------
; // Radio Panel 14.May.2009
; //----------------------------------------------------------------------------
; 
; #include <m8c.h>
; #include "PSoCAPI.h"
; #include "hbheader.h"
; #include "stdlib.h"
; //A\x07MA S\xF5RESI
; #define SLAVE_ADDRESS 21
; 
; void LCD_PrintInt(int val),disp_msg(BYTE line, BYTE row, char *msgm);
; void LCD_PrintFloat(float vall), clrdisp(void);
; 
; BYTE    txBuffer[32];  
; BYTE    rxBuffer[32]; 
; BYTE	lastport;
; BYTE 	adc_res[16] = {0}; 
; BYTE	ekran_res[4] = {0};  // [0]=NAV ACT, [1]=NAV STB
; BYTE	sol_intkisim=0, sol_decisim=0, sag_intkisim=0, sag_decisim=0;
; BYTE 	dummy1;
; 
; BYTE    status;  
; BYTE *ptr;
; //char *intRet;
; char intRet[8];
; char TABELA[]="  \x06\x01\x02\x02\x03\x06  \x04\x06\x07\x05  ";
; 
; WORD cnt;
; WORD acnt;
; WORD Timeout_d;
; void  I2Oku(void), I2Yaz(void);
; void Int_tostring(int val);
; 
; #pragma interrupt_handler Counter8_1_ISR, encoder_isr
; void Counter8_1_ISR(void); void encoder_isr(void);
; 
; void dly(long int mS), init_environment(void), init_cgram(void);
; 
; void Counter8_1_ISR() {Counter8_1_DisableInt(); Counter8_1_Stop(); DELAY_CLR;}
	.dbline 40
	push X
	xcall _Counter8_1_DisableInt
	.dbline 40
	xcall _Counter8_1_Stop
	pop X
	.dbline 40
	mov REG[0xd0],>_STATUS
	mov A,[_STATUS+1]
	and A,-2
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov REG[0xd0],>_STATUS
	mov A,[_STATUS]
	mov REG[0xd0],>__r0
	mov [__r0],A
	mov A,[__r1]
	push A
	mov A,[__r0]
	mov REG[0xd0],>_STATUS
	mov [_STATUS],A
	pop A
	mov [_STATUS+1],A
	.dbline -2
	.dbline 40
L1:
	mov REG[0xD0],>__r0
	pop A
	mov [__rZ],A
	pop A
	mov [__rY],A
	pop A
	mov [__rX],A
	pop A
	mov [__r11],A
	pop A
	mov [__r10],A
	pop A
	mov [__r9],A
	pop A
	mov [__r8],A
	pop A
	mov [__r7],A
	pop A
	mov [__r6],A
	pop A
	mov [__r5],A
	pop A
	mov [__r4],A
	pop A
	mov [__r3],A
	pop A
	mov [__r2],A
	pop A
	mov [__r1],A
	pop A
	mov [__r0],A
	pop A
	mov REG[213],A
	pop A
	mov REG[212],A
	pop A
	mov REG[211],A
	pop A
	mov REG[208],A
	pop A
	.dbline 0 ; func end
	reti
	.dbend
	.area lit(rom, con, rel)
_CG::
	.byte 32,32,32,32,32,0
	.byte 32,'X,32,32,'X,0
	.byte 32,'X,'X,32,32,0
	.byte 'X,'X,'X,32,32,0
	.byte 32,'X,'X,'X,32,0
	.byte 'X,32,32,32,'X,0
	.byte 32,'X,'X,32,32,0
	.byte 32,32,'X,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,'X,32,32,'X,0
	.byte 32,'X,32,'X,32,0
	.byte 'X,32,32,32,32,0
	.byte 32,32,'X,32,32,0
	.byte 'X,'X,32,'X,'X,0
	.byte 32,'X,32,'X,32,0
	.byte 32,32,'X,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,'X,32,32,'X,0
	.byte 32,'X,32,'X,32,0
	.byte 'X,'X,32,32,32,0
	.byte 32,32,'X,32,32,0
	.byte 'X,32,'X,32,'X,0
	.byte 32,'X,'X,32,32,0
	.byte 32,32,'X,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,'X,32,32,'X,0
	.byte 32,'X,32,'X,32,0
	.byte 'X,32,32,32,32,0
	.byte 32,32,'X,32,32,0
	.byte 'X,32,32,32,'X,0
	.byte 32,'X,32,'X,32,0
	.byte 32,32,'X,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,'X,'X,32,0
	.byte 32,'X,'X,32,32,0
	.byte 'X,'X,'X,32,32,0
	.byte 32,32,'X,32,32,0
	.byte 'X,32,32,32,'X,0
	.byte 32,'X,32,'X,32,0
	.byte 32,32,'X,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.byte 32,32,32,32,32,0
	.dbsym e CG _CG A[384:8:8:6]c
	.area text(rom, con, rel)
	.dbfile ./main.c
	.dbfunc e encoder_isr _encoder_isr fV
_encoder_isr::
	.dbline -1
	.dbline 52
; 
; const char CG[8][8][6] = {
;     "     "," X  X"," XX  ","XXX  "," XXX ","X   X"," XX  ","  X  ",
;     "     "," X  X"," X X ","X    ","  X  ","XX XX"," X X ","  X  ",
;     "     "," X  X"," X X ","XX   ","  X  ","X X X"," XX  ","  X  ",
;     "     "," X  X"," X X ","X    ","  X  ","X   X"," X X ","  X  ",
;     "     ","  XX "," XX  ","XXX  ","  X  ","X   X"," X X ","  X  ",
;     "     ","     ","     ","     ","     ","     ","     ","     ",
;     "     ","     ","     ","     ","     ","     ","     ","     ",
;     "     ","     ","     ","     ","     ","     ","     ","     "  };
; 
; void encoder_isr(void){
	.dbline -2
	.dbline 54
; 
; }
L2:
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e init_environment _init_environment fV
_init_environment::
	.dbline -1
	.dbline 57
; 		
; void init_environment()
; {  	PRT1DR |= 0xA0;		//release et pinleri
	.dbline 57
	or REG[0x4],-96
	.dbline 58
; 	I2CHW_1_Start(); I2CHW_1_EnableSlave(); I2CHW_1_EnableInt();
	push X
	xcall _I2CHW_1_Start
	.dbline 58
	xcall _I2CHW_1_EnableSlave
	.dbline 58
	xcall _I2CHW_1_EnableInt
	.dbline 59
; 	I2CHW_1_InitRamRead(txBuffer,32);
	mov A,32
	push A
	mov A,>_txBuffer
	push A
	mov A,<_txBuffer
	push A
	xcall _I2CHW_1_InitRamRead
	add SP,-3
	.dbline 60
;     I2CHW_1_InitWrite(rxBuffer,32);
	mov A,32
	push A
	mov A,>_rxBuffer
	push A
	mov A,<_rxBuffer
	push A
	xcall _I2CHW_1_InitWrite
	add SP,-3
	pop X
	.dbline 62
;                   // Initialize LCD  
; 	M8C_EnableGInt;	M8C_EnableIntMask (INT_MSK0, INT_MSK0_GPIO);
		or  F, 01h

	.dbline 62
	or REG[0xe0],32
	.dbline 64
;   
;     ekran_res[0]=124; lastport=0;
	mov REG[0xd0],>_ekran_res
	mov [_ekran_res],124
	.dbline 64
	mov REG[0xd0],>_lastport
	mov [_lastport],0
	.dbline -2
	.dbline 66
; 
;     }
L3:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e init_cgram _init_cgram fV
;           addr -> X+7
;           data -> X+6
;          datab -> X+5
;          addrb -> X+4
;              i -> X+3
;              j -> X+2
;              k -> X+1
;          shift -> X+0
_init_cgram::
	.dbline -1
	push X
	mov X,SP
	add SP,8
	.dbline 70
;     
; void init_cgram()
; 	
; { BYTE i,j,k, shift,addr,data,addrb,datab;
	.dbline 71
	mov [X+3],0
	xjmp L8
L5:
	.dbline 71
; 	for(i=0;i<8;i++) for(j=0;j<8;j++)
	mov [X+2],0
	xjmp L12
L9:
	.dbline 72
;   	{ addr=0x40|i*8|j; k=0; data=0; shift=0x10; 
	.dbline 72
	mov A,[X+3]
	mov REG[0xd0],>__r0
	asl A
	asl A
	asl A
	mov [__r0],A
	or [__r0],64
	mov A,[X+2]
	or [__r0],A
	mov A,[__r0]
	mov [X+7],A
	.dbline 72
	mov [X+1],0
	.dbline 72
	mov [X+6],0
	.dbline 72
	mov [X+0],16
	xjmp L14
L13:
	.dbline 73
	.dbline 73
	mov REG[0xd0],>__r0
	mov A,[X+2]
	mov [__r1],A
	mov A,0
	push A
	mov A,[__r1]
	push A
	mov A,0
	push A
	mov A,48
	push A
	xcall __mul16
	add SP,-4
	mov A,[__rX]
	mov [__r1],A
	mov A,[__rY]
	mov [__r0],A
	add [__r1],<_CG
	adc [__r0],>_CG
	mov A,[X+3]
	mov [__r3],A
	mov A,0
	push A
	mov A,[__r3]
	push A
	mov A,0
	push A
	mov A,6
	push A
	xcall __mul16
	add SP,-4
	mov A,[__rX]
	mov [__r3],A
	mov A,[__rY]
	mov [__r2],A
	mov A,[__r3]
	add A,[__r1]
	mov [__r1],A
	mov A,[__r2]
	adc A,[__r0]
	mov [__r0],A
	mov A,[X+1]
	add A,[__r1]
	mov [__r1],A
	mov A,0
	adc A,[__r0]
	push X
	mov X,[__r1]
	romx
	pop X
	cmp A,88
	jnz L16
	.dbline 73
	mov A,[X+6]
	or A,[X+0]
	mov [X+6],A
L16:
	.dbline 73
	inc [X+1]
	.dbline 73
	and F,-5
	rrc [X+0]
	.dbline 73
L14:
	.dbline 73
	cmp [X+0],0
	jnz L13
	.dbline 74
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-33
	mov A,[__r0]
	mov REG[ 0],A
	.dbline 74
	mov A,REG[ 0]
	mov [__r0],A
	and [__r0],-65
	mov A,[__r0]
	mov REG[ 0],A
	.dbline 74
	mov A,REG[ 0]
	mov [__r0],A
	and [__r0],-17
	mov A,[__r0]
	mov REG[ 0],A
	.dbline 74
	mov A,0
	push A
	push A
	push A
	mov A,1
	push A
	xcall _dly
	.dbline 75
	mov A,[X+7]
	mov REG[0xd0],>__r0
	asr A
	asr A
	asr A
	asr A
	and A,15
	mov [X+4],A
	.dbline 75
	mov A,[X+4]
	or A,16
	mov [X+4],A
	.dbline 75
	mov A,[X+4]
	and A,-33
	mov [X+4],A
	.dbline 75
	mov A,[X+4]
	and A,-65
	mov [X+4],A
	.dbline 76
	mov A,[X+4]
	mov REG[ 0],A
	.dbline 76
	or REG[ 0],16
	.dbline 76
	mov A,0
	push A
	push A
	push A
	mov A,1
	push A
	xcall _dly
	add SP,-8
	.dbline 76
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-17
	mov A,[__r0]
	mov REG[ 0],A
	.dbline 76
	mov A,0
	push A
	push A
	push A
	mov A,1
	push A
	xcall _dly
	.dbline 76
	mov A,[X+7]
	mov [X+4],A
	.dbline 76
	mov REG[0xd0],>__r0
	mov A,[X+4]
	or A,16
	mov [X+4],A
	.dbline 76
	mov A,[X+4]
	and A,-33
	mov [X+4],A
	.dbline 76
	mov A,[X+4]
	and A,-65
	mov [X+4],A
	.dbline 77
	mov A,[X+4]
	mov REG[ 0],A
	.dbline 77
	or REG[ 0],16
	.dbline 77
	mov A,0
	push A
	push A
	push A
	mov A,1
	push A
	xcall _dly
	add SP,-8
	.dbline 77
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-17
	mov A,[__r0]
	mov REG[ 0],A
	.dbline 77
	mov A,0
	push A
	push A
	push A
	mov A,1
	push A
	xcall _dly
	.dbline 79
	or REG[ 0],32
	.dbline 79
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-65
	mov A,[__r0]
	mov REG[ 0],A
	.dbline 79
	mov A,0
	push A
	push A
	push A
	mov A,1
	push A
	xcall _dly
	add SP,-8
	.dbline 80
	mov A,[X+6]
	mov REG[0xd0],>__r0
	asr A
	asr A
	asr A
	asr A
	and A,15
	mov [X+5],A
	.dbline 80
	mov A,[X+5]
	or A,16
	mov [X+5],A
	.dbline 80
	mov A,[X+5]
	or A,32
	mov [X+5],A
	.dbline 80
	mov A,[X+5]
	and A,-65
	mov [X+5],A
	.dbline 81
	mov A,[X+5]
	mov REG[ 0],A
	.dbline 81
	or REG[ 0],16
	.dbline 81
	mov A,0
	push A
	push A
	push A
	mov A,1
	push A
	xcall _dly
	.dbline 81
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-17
	mov A,[__r0]
	mov REG[ 0],A
	.dbline 81
	mov A,0
	push A
	push A
	push A
	mov A,1
	push A
	xcall _dly
	add SP,-8
	.dbline 81
	mov A,[X+6]
	mov [X+5],A
	.dbline 81
	mov REG[0xd0],>__r0
	mov A,[X+5]
	or A,16
	mov [X+5],A
	.dbline 81
	mov A,[X+5]
	or A,32
	mov [X+5],A
	.dbline 81
	mov A,[X+5]
	and A,-65
	mov [X+5],A
	.dbline 82
	mov A,[X+5]
	mov REG[ 0],A
	.dbline 82
	or REG[ 0],16
	.dbline 82
	mov A,0
	push A
	push A
	push A
	mov A,1
	push A
	xcall _dly
	.dbline 82
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-17
	mov A,[__r0]
	mov REG[ 0],A
	.dbline 82
	mov A,0
	push A
	push A
	push A
	mov A,1
	push A
	xcall _dly
	add SP,-8
	.dbline 83
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-33
	mov A,[__r0]
	mov REG[ 0],A
	.dbline 83
	mov A,REG[ 0]
	mov [__r0],A
	and [__r0],-65
	mov A,[__r0]
	mov REG[ 0],A
	.dbline 83
L10:
	.dbline 71
	inc [X+2]
L12:
	.dbline 71
	cmp [X+2],8
	jc L9
X0:
L6:
	.dbline 71
	inc [X+3]
L8:
	.dbline 71
	cmp [X+3],8
	jc L5
X1:
	.dbline -2
	.dbline 83
;     	while(shift){ if(CG[j][i][k]=='X') data|=shift; k++; shift>>=1; }
; 			RS0;RW0;EN0;dly(1); 
;     		addrb=(addr>>4); addrb|=BSET_4; addrb&=BCLR_5; addrb&=BCLR_6;
;     		LCD_BUS=(addrb); EN1;dly(1);EN0;dly(1);addrb=(addr); addrb|=BSET_4; addrb&=BCLR_5; addrb&=BCLR_6;
;     		LCD_BUS=(addrb); EN1;dly(1);EN0;dly(1);
;     		
;     		RS1;RW0;dly(1); 
;     		datab=(data>>4); datab|=BSET_4; datab|=BSET_5; datab&=BCLR_6;
;     		LCD_BUS=(datab); EN1;dly(1);EN0;dly(1);datab=(data); datab|=BSET_4; datab|=BSET_5; datab&=BCLR_6;
;     		LCD_BUS=(datab); EN1;dly(1);EN0;dly(1);
;    			RS0; RW0;} }
L4:
	add SP,-8
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l addr 7 c
	.dbsym l data 6 c
	.dbsym l datab 5 c
	.dbsym l addrb 4 c
	.dbsym l i 3 c
	.dbsym l j 2 c
	.dbsym l k 1 c
	.dbsym l shift 0 c
	.dbend
	.dbfunc e init_delay_counter _init_delay_counter fV
;             DC -> X-11
;            mSn -> X-7
_init_delay_counter::
	.dbline -1
	push X
	mov X,SP
	.dbline 87
; 
; 
; void init_delay_counter(long int mSn, long int DC)
; {   Counter8_1_WritePeriod(mSn); Counter8_1_WriteCompareValue(DC); Counter8_1_EnableInt();DELAY_SET; Counter8_1_Start();}
	.dbline 87
	mov REG[0xd0],>__r0
	mov A,[X-4]
	push X
	xcall _Counter8_1_WritePeriod
	pop X
	.dbline 87
	mov REG[0xd0],>__r0
	mov A,[X-8]
	push X
	xcall _Counter8_1_WriteCompareValue
	.dbline 87
	xcall _Counter8_1_EnableInt
	pop X
	.dbline 87
	mov REG[0xd0],>_STATUS
	or [_STATUS+1],1
	.dbline 87
	push X
	xcall _Counter8_1_Start
	pop X
	.dbline -2
	.dbline 87
L18:
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l DC -11 L
	.dbsym l mSn -7 L
	.dbend
	.dbfunc e main _main fV
_main::
	.dbline -1
	push X
	mov X,SP
	add SP,2
	.dbline 91
; /* ---------------------------------------------------------------------- */
; 
; void main()
; {
	.dbline 97
; // NAV LIMITS   = 108.00-117.95 (2048--6037)
; // COMM LIMITS  = 118.00-136.97 (6144--13975)
; // XPNDR LIMITS = 0000-7777		(Octal system)
; // ADF LIMITS   = 0100.0-1799.9
; 
; 	init_environment(); LCD_1_Start(); LCD_1_InitBG(LCD_1_LINE_BG); //init_cgram();
	xcall _init_environment
	.dbline 97
	push X
	xcall _LCD_1_Start
	.dbline 97
	mov A,1
	xcall _LCD_1_InitBG
	.dbline 99
;  
;    LCD_1_Position(0,0);
	mov A,0
	mov X,A
	xcall _LCD_1_Position
	.dbline 100
;    LCD_1_PrCString("  RUDDER  TRIM  ");
	mov A,>L20
	push A
	mov A,<L20
	mov X,A
	pop A
	xcall _LCD_1_PrCString
	pop X
	xjmp L22
L21:
	.dbline 103
; 
; 	
;  	while(1)  {
	.dbline 106
; 			//txBuffer[0]=
; 
; 			I2Oku();
	xcall _I2Oku
	.dbline 108
; //DIKKAT REMARKLI SATIRLAR ALPS marka ICIN KONULDU. HEM HIGH HEM LOW DARBESI ICIN
; 			dummy1 = PRT3DR^lastport;	//durumu degisen pin varmi?
	mov A,REG[0xc]
	mov REG[0xd0],>__r0
	mov [__r0],A
	mov REG[0xd0],>_lastport
	mov A,[_lastport]
	mov REG[0xd0],>__r0
	xor [__r0],A
	mov A,[__r0]
	mov REG[0xd0],>_dummy1
	mov [_dummy1],A
	.dbline 110
; 
; 			if (dummy1 & BSET_0) {		//0. pinin durumu degismis
	tst [_dummy1],1
	jz L24
	.dbline 110
	.dbline 111
; 				lastport=PRT3DR;
	mov A,REG[0xc]
	mov REG[0xd0],>_lastport
	mov [_lastport],A
	.dbline 112
	mov A,REG[0xc]
	mov REG[0xd0],>__r0
	and A,3
	mov [X+1],A
	mov [X+0],0
	cmp [X+0],0
	jnz X5
	cmp [X+1],1
	jz L29
X5:
	cmp [X+0],0
	jnz X6
	cmp [X+1],3
	jz L32
X6:
	xjmp L26
X2:
	.dbline 112
; 				switch  (PRT3DR & 0b00000011) {	//bu encoder hangi yone donuyor?
L29:
	.dbline 114
	mov REG[0xd0],>_ekran_res
	cmp [_ekran_res],3
	jnz L30
	.dbline 114
	.dbline 114
	xjmp L27
L30:
	.dbline 114
; 						case 1: 
; 									if (ekran_res[0]==3) {} else {ekran_res[0]--; }
	.dbline 114
	mov REG[0xd0],>_ekran_res
	dec [_ekran_res]
	.dbline 114
	.dbline 115
; 								break;
	xjmp L27
L32:
	.dbline 117
	mov REG[0xd0],>_ekran_res
	cmp [_ekran_res],-1
	jnz L33
	.dbline 117
	.dbline 117
	xjmp L27
L33:
	.dbline 117
; 						case 3: 
; 									if (ekran_res[0]==255) {} else {ekran_res[0]++; }
	.dbline 117
	mov REG[0xd0],>_ekran_res
	inc [_ekran_res]
	.dbline 117
	.dbline 118
; 								break;
L26:
L27:
	.dbline 120
; 						
; 						}}
L24:
	.dbline 121
; 			if (dummy1 & BSET_2) {		//2. pinin durumu degismis
	mov REG[0xd0],>_dummy1
	tst [_dummy1],4
	jz L35
	.dbline 121
	.dbline 122
; 				lastport=PRT3DR;
	mov A,REG[0xc]
	mov REG[0xd0],>_lastport
	mov [_lastport],A
	.dbline 123
; 				switch  (PRT3DR & 0b00001100) {	//bu encoder hangi yone donuyor?
	mov A,REG[0xc]
	mov REG[0xd0],>__r0
	and A,12
	mov [X+1],A
	mov [X+0],0
	mov A,[X+1]
	sub A,4
	mov [__rY],A
	mov A,[X+0]
	xor A,-128
	sbb A,(0 ^ 0x80)
	jc L37
	or A,[__rY]
	jz L40
X7:
L46:
	cmp [X+0],0
	jnz X8
	cmp [X+1],12
	jz L43
X8:
	xjmp L37
X3:
	.dbline 123
L40:
	.dbline 126
	mov REG[0xd0],>_ekran_res
	cmp [_ekran_res],3
	jnz L41
	.dbline 126
	.dbline 126
	xjmp L38
L41:
	.dbline 126
; 						
; 						case 4: 
; 									if (ekran_res[0]==3) {} else {ekran_res[0]--; }
	.dbline 126
	mov REG[0xd0],>_ekran_res
	dec [_ekran_res]
	.dbline 126
	.dbline 127
; 								break;
	xjmp L38
L43:
	.dbline 130
	mov REG[0xd0],>_ekran_res
	cmp [_ekran_res],-1
	jnz L44
	.dbline 130
	.dbline 130
	xjmp L38
L44:
	.dbline 130
; 						
; 						case 12: 
; 									if (ekran_res[0]==255) {} else {ekran_res[0]++; }
	.dbline 130
	mov REG[0xd0],>_ekran_res
	inc [_ekran_res]
	.dbline 130
	.dbline 131
; 								break;
L37:
L38:
	.dbline 133
; 						
; 						}}
L35:
	.dbline 135
	mov REG[0xd0],>_ekran_res
	mov A,3
	push A
	mov A,[_ekran_res]
	push A
	mov REG[0xd0],>__r0
	xcall __divmodu_8X8_8
	pop A
	add SP,-1
	push X
	push A
	mov A,16
	push A
	mov A,0
	push A
	mov A,1
	push A
	xcall _LCD_1_DrawBG
	add SP,-4
	pop X
	.dbline 139
	mov REG[0xd0],>_ekran_res
	mov A,[_ekran_res]
	mov REG[0xd0],>_txBuffer
	mov [_txBuffer],A
	.dbline 140
	mov [_txBuffer+1],0
	.dbline 142
	xcall _I2Yaz
	.dbline 145
L22:
	.dbline 103
	xjmp L21
X4:
	.dbline -2
	.dbline 146
; 						
; 				LCD_1_DrawBG(1,0,16,ekran_res[0]/3);
; //   LCD_1_Position(1,5);
; //   LCD_PrintInt(ekran_res[0]);
; 				
; 			txBuffer[0]=ekran_res[0];
; 			txBuffer[1]=0;				//buton toggle vs...
; 						
; 			I2Yaz();
; 
; 	
; }//while kapa	
; }//main kapa
L19:
	add SP,-2
	pop X
	.dbline 0 ; func end
	jmp .
	.dbend
	.dbfunc e dly _dly fV
;             mS -> X-7
_dly::
	.dbline -1
	push X
	mov X,SP
	.dbline 148
	.dbline 148
	mov REG[0xd0],>__r0
	mov A,0
	push A
	push A
	push A
	mov A,2
	push A
	mov A,[X-7]
	push A
	mov A,[X-6]
	push A
	mov A,[X-5]
	push A
	mov A,[X-4]
	push A
	xcall __divmod_32X32_32
	pop A
	mov [__r3],A
	pop A
	mov [__r2],A
	pop A
	mov [__r1],A
	pop A
	add SP,-4
	push A
	mov A,[__r1]
	push A
	mov A,[__r2]
	push A
	mov A,[__r3]
	push A
	mov A,[X-7]
	push A
	mov A,[X-6]
	push A
	mov A,[X-5]
	push A
	mov A,[X-4]
	push A
	xcall _init_delay_counter
	add SP,-8
L49:
	.dbline 148
L50:
	.dbline 148
; 
; void dly(long int mS){init_delay_counter(mS,mS/2); while (DELAY_INVOKE);{}}
	mov REG[0xd0],>_STATUS
	mov A,[_STATUS+1]
	and A,1
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov REG[0xd0],>_STATUS
	mov A,[_STATUS]
	and A,0
	mov REG[0xd0],>__r0
	cmp A,0
	jnz L49
	cmp [__r1],0
	jnz L49
X9:
	.dbline 148
	.dbline 148
	.dbline -2
	.dbline 148
L48:
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l mS -7 L
	.dbend
	.dbfunc e I2Yaz _I2Yaz fV
_I2Yaz::
	.dbline -1
	.dbline 151
	.dbline 152
	push X
	xcall _I2CHW_1_bReadI2CStatus
	pop X
	mov REG[0xd0],>_status
	mov [_status],A
	.dbline 153
	tst [_status],4
	jz L53
	.dbline 154
	.dbline 155
	push X
	xcall _I2CHW_1_ClrRdStatus
	.dbline 156
	mov A,32
	push A
	mov A,>_txBuffer
	push A
	mov A,<_txBuffer
	push A
	xcall _I2CHW_1_InitRamRead
	add SP,-3
	pop X
	.dbline 156
L53:
	.dbline -2
	.dbline 156
; 
; void I2Yaz()
; {
; 		status = I2CHW_1_bReadI2CStatus();
; 		if( status & I2CHW_RD_COMPLETE )
; 		{
; 			I2CHW_1_ClrRdStatus();
; 			I2CHW_1_InitRamRead(txBuffer,32);}}
L52:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e I2Oku _I2Oku fV
_I2Oku::
	.dbline -1
	.dbline 159
	.dbline 160
	push X
	xcall _I2CHW_1_bReadI2CStatus
	pop X
	mov REG[0xd0],>_status
	mov [_status],A
	.dbline 161
	tst [_status],64
	jz L56
	.dbline 162
	.dbline 163
	push X
	xcall _I2CHW_1_ClrWrStatus
	.dbline 164
	mov A,32
	push A
	mov A,>_rxBuffer
	push A
	mov A,<_rxBuffer
	push A
	xcall _I2CHW_1_InitWrite
	add SP,-3
	pop X
	.dbline 164
L56:
	.dbline -2
	.dbline 164
; 
; void I2Oku()
; {
;         status = I2CHW_1_bReadI2CStatus();  
;         if( status & I2CHW_WR_COMPLETE )  
;         {
; 	        I2CHW_1_ClrWrStatus();  
; 	        I2CHW_1_InitWrite(rxBuffer,32);}}
L55:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e clrdisp _clrdisp fV
_clrdisp::
	.dbline -1
	.dbline 166
; 	        
; void clrdisp(){LCD_1_Position(0,0);LCD_1_PrCString("                ");LCD_1_Position(1,0);LCD_1_PrCString("                ");}
	.dbline 166
	push X
	mov A,0
	mov X,A
	xcall _LCD_1_Position
	.dbline 166
	mov A,>L59
	push A
	mov A,<L59
	mov X,A
	pop A
	xcall _LCD_1_PrCString
	.dbline 166
	mov X,0
	mov A,1
	xcall _LCD_1_Position
	.dbline 166
	mov A,>L59
	push A
	mov A,<L59
	mov X,A
	pop A
	xcall _LCD_1_PrCString
	pop X
	.dbline -2
	.dbline 166
L58:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e disp_msg _disp_msg fV
;           msgm -> X-7
;            row -> X-5
;           line -> X-4
_disp_msg::
	.dbline -1
	push X
	mov X,SP
	.dbline 167
; void disp_msg(BYTE line, BYTE row, char *msgm){LCD_1_Position(line,row);LCD_1_PrString(msgm);}
	.dbline 167
	push X
	mov A,[X-5]
	push A
	mov A,[X-4]
	pop X
	xcall _LCD_1_Position
	pop X
	.dbline 167
	push X
	mov A,[X-7]
	push A
	mov A,[X-6]
	mov X,A
	pop A
	xcall _LCD_1_PrString
	pop X
	.dbline -2
	.dbline 167
L60:
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l msgm -7 pc
	.dbsym l row -5 c
	.dbsym l line -4 c
	.dbend
	.dbfunc e LCD_PrintInt _LCD_PrintInt fV
;         intRet -> X+0
;            val -> X-5
_LCD_PrintInt::
	.dbline -1
	push X
	mov X,SP
	add SP,2
	.dbline 170
; 
; void LCD_PrintInt(int val) 
; {char *intRet; itoa(intRet, val, 10 ); LCD_1_PrString(intRet);}
	.dbline 170
	mov A,0
	push A
	mov A,10
	push A
	mov A,[X-5]
	push A
	mov A,[X-4]
	push A
	mov A,[X+0]
	push A
	mov A,[X+1]
	push A
	xcall _itoa
	add SP,-6
	.dbline 170
	push X
	mov A,[X+0]
	push A
	mov A,[X+1]
	mov X,A
	pop A
	xcall _LCD_1_PrString
	pop X
	.dbline -2
	.dbline 170
L61:
	add SP,-2
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l intRet 0 pc
	.dbsym l val -5 I
	.dbend
	.dbfunc e LCD_PrintFloat _LCD_PrintFloat fV
;        statuss -> X+4
;       floatRet -> X+2
;              i -> X+0
;           vall -> X-7
_LCD_PrintFloat::
	.dbline -1
	push X
	mov X,SP
	add SP,6
	.dbline 173
; 
; void LCD_PrintFloat(float vall)
; {
	.dbline 175
; int statuss;
; int i = 0;
	mov [X+1],0
	mov [X+0],0
	.dbline 178
; char *floatRet;
; 
; floatRet = ftoa(vall + 0.005, &statuss);
	mov REG[0xd0],>__r0
	mov [__r1],X
	add [__r1],4
	mov A,3
	push A
	mov A,[__r1]
	push A
	mov A,59
	push A
	mov A,-93
	push A
	mov A,-41
	push A
	mov A,10
	push A
	mov A,[X-7]
	push A
	mov A,[X-6]
	push A
	mov A,[X-5]
	push A
	mov A,[X-4]
	push A
	xcall __fpadd
	pop A
	mov [__r3],A
	pop A
	mov [__r2],A
	pop A
	mov [__r1],A
	pop A
	add SP,-4
	push A
	mov A,[__r1]
	push A
	mov A,[__r2]
	push A
	mov A,[__r3]
	push A
	xcall _ftoa
	add SP,-6
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov [X+3],A
	mov A,[__r0]
	mov [X+2],A
	xjmp L64
L63:
	.dbline 179
; while(floatRet[i]){
	.dbline 180
; if('.' == floatRet[i])
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,[X+3]
	mov [__r1],A
	mov A,[X+0]
	adc A,[X+2]
	mov REG[0xd4],A
	mvi A,[__r1]
	cmp A,46
	jnz L66
	.dbline 181
; break;
	xjmp L65
L66:
	.dbline 182
	inc [X+1]
	adc [X+0],0
	.dbline 183
L64:
	.dbline 179
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,[X+3]
	mov [__r1],A
	mov A,[X+0]
	adc A,[X+2]
	mov REG[0xd4],A
	mvi A,[__r1]
	cmp A,0
	jnz L63
L65:
	.dbline 184
; i++;
; }
; floatRet[i+3] = '\0';
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,[X+3]
	mov [__r1],A
	mov A,[X+0]
	adc A,[X+2]
	mov [__r0],A
	add [__r1],3
	adc [__r0],0
	mov A,[__r0]
	mov REG[0xd5],A
	mov A,0
	mvi [__r1],A
	.dbline 185
; LCD_1_PrString(floatRet);}
	push X
	mov A,[X+2]
	push A
	mov A,[X+3]
	mov X,A
	pop A
	xcall _LCD_1_PrString
	pop X
	.dbline -2
	.dbline 185
L62:
	add SP,-6
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l statuss 4 I
	.dbsym l floatRet 2 pc
	.dbsym l i 0 I
	.dbsym l vall -7 D
	.dbend
	.area data(ram, con, rel)
	.dbfile ./main.c
_Timeout_d::
	.byte 0,0
	.dbsym e Timeout_d _Timeout_d i
	.area data(ram, con, rel)
	.dbfile ./main.c
_acnt::
	.byte 0,0
	.dbsym e acnt _acnt i
	.area data(ram, con, rel)
	.dbfile ./main.c
_cnt::
	.byte 0,0
	.dbsym e cnt _cnt i
	.area data(ram, con, rel)
	.dbfile ./main.c
_intRet::
	.byte 0,0,0,0,0,0,0,0
	.dbsym e intRet _intRet A[8:8]c
	.area data(ram, con, rel)
	.dbfile ./main.c
_ptr::
	.byte 0,0
	.dbsym e ptr _ptr pc
	.area data(ram, con, rel)
	.dbfile ./main.c
_dummy1::
	.byte 0
	.dbsym e dummy1 _dummy1 c
	.area data(ram, con, rel)
	.dbfile ./main.c
_lastport::
	.byte 0
	.dbsym e lastport _lastport c
	.area data(ram, con, rel)
	.dbfile ./main.c
_rxBuffer::
	.word 0,0,0,0,0
	.word 0,0,0,0,0
	.word 0,0,0,0,0
	.byte 0,0
	.dbsym e rxBuffer _rxBuffer A[32:32]c
	.area data(ram, con, rel)
	.dbfile ./main.c
_txBuffer::
	.word 0,0,0,0,0
	.word 0,0,0,0,0
	.word 0,0,0,0,0
	.byte 0,0
	.dbsym e txBuffer _txBuffer A[32:32]c
	.area data(ram, con, rel)
	.dbfile ./main.c
_mevcut::
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.byte 0,0,0,0
	.dbfile ./hbheader.h
	.dbsym e mevcut _mevcut A[64:32]I
	.area data(ram, con, rel)
	.dbfile ./hbheader.h
_status::
	.byte 0
	.dbfile ./main.c
	.dbsym e status _status c
	.area data(ram, con, rel)
	.dbfile ./main.c
_dummy::
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.byte 0,0,0,0
	.dbfile ./hbheader.h
	.dbsym e dummy _dummy A[64:32]I
	.area lit(rom, con, rel)
L59:
	.byte 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
	.byte 0
L20:
	.byte 32,32,'R,'U,'D,'D,'E,'R,32,32,'T,'R,'I,'M,32,32
	.byte 0
