//----------------------------------------------------------------------------
// Radio Panel 14.May.2009
//----------------------------------------------------------------------------

#include <m8c.h>
#include "PSoCAPI.h"
#include "hbheader.h"
#include "stdlib.h"
//A\x07MA S\xF5RESI
#define SLAVE_ADDRESS 21

void LCD_PrintInt(int val),disp_msg(BYTE line, BYTE row, char *msgm);
void LCD_PrintFloat(float vall), clrdisp(void);

BYTE    txBuffer[32];  
BYTE    rxBuffer[32]; 
BYTE	lastport;
BYTE 	adc_res[16] = {0}; 
BYTE	ekran_res[4] = {0};  // [0]=NAV ACT, [1]=NAV STB
BYTE	sol_intkisim=0, sol_decisim=0, sag_intkisim=0, sag_decisim=0;
BYTE 	dummy1;

BYTE    status;  
BYTE *ptr;
//char *intRet;
char intRet[8];
char TABELA[]="  \x06\x01\x02\x02\x03\x06  \x04\x06\x07\x05  ";

WORD cnt;
WORD acnt;
WORD Timeout_d;
void  I2Oku(void), I2Yaz(void);
void Int_tostring(int val);

#pragma interrupt_handler Counter8_1_ISR, encoder_isr
void Counter8_1_ISR(void); void encoder_isr(void);

void dly(long int mS), init_environment(void), init_cgram(void);

void Counter8_1_ISR() {Counter8_1_DisableInt(); Counter8_1_Stop(); DELAY_CLR;}

const char CG[8][8][6] = {
    "     "," X  X"," XX  ","XXX  "," XXX ","X   X"," XX  ","  X  ",
    "     "," X  X"," X X ","X    ","  X  ","XX XX"," X X ","  X  ",
    "     "," X  X"," X X ","XX   ","  X  ","X X X"," XX  ","  X  ",
    "     "," X  X"," X X ","X    ","  X  ","X   X"," X X ","  X  ",
    "     ","  XX "," XX  ","XXX  ","  X  ","X   X"," X X ","  X  ",
    "     ","     ","     ","     ","     ","     ","     ","     ",
    "     ","     ","     ","     ","     ","     ","     ","     ",
    "     ","     ","     ","     ","     ","     ","     ","     "  };

void encoder_isr(void){

}
		
void init_environment()
{  	PRT1DR |= 0xA0;		//release et pinleri
	I2CHW_1_Start(); I2CHW_1_EnableSlave(); I2CHW_1_EnableInt();
	I2CHW_1_InitRamRead(txBuffer,32);
    I2CHW_1_InitWrite(rxBuffer,32);
                  // Initialize LCD  
	M8C_EnableGInt;	M8C_EnableIntMask (INT_MSK0, INT_MSK0_GPIO);
  
    ekran_res[0]=124; lastport=0;

    }
    
void init_cgram()
	
{ BYTE i,j,k, shift,addr,data,addrb,datab;
	for(i=0;i<8;i++) for(j=0;j<8;j++)
  	{ addr=0x40|i*8|j; k=0; data=0; shift=0x10; 
    	while(shift){ if(CG[j][i][k]=='X') data|=shift; k++; shift>>=1; }
			RS0;RW0;EN0;dly(1); 
    		addrb=(addr>>4); addrb|=BSET_4; addrb&=BCLR_5; addrb&=BCLR_6;
    		LCD_BUS=(addrb); EN1;dly(1);EN0;dly(1);addrb=(addr); addrb|=BSET_4; addrb&=BCLR_5; addrb&=BCLR_6;
    		LCD_BUS=(addrb); EN1;dly(1);EN0;dly(1);
    		
    		RS1;RW0;dly(1); 
    		datab=(data>>4); datab|=BSET_4; datab|=BSET_5; datab&=BCLR_6;
    		LCD_BUS=(datab); EN1;dly(1);EN0;dly(1);datab=(data); datab|=BSET_4; datab|=BSET_5; datab&=BCLR_6;
    		LCD_BUS=(datab); EN1;dly(1);EN0;dly(1);
   			RS0; RW0;} }


void init_delay_counter(long int mSn, long int DC)
{   Counter8_1_WritePeriod(mSn); Counter8_1_WriteCompareValue(DC); Counter8_1_EnableInt();DELAY_SET; Counter8_1_Start();}
/* ---------------------------------------------------------------------- */

void main()
{
// NAV LIMITS   = 108.00-117.95 (2048--6037)
// COMM LIMITS  = 118.00-136.97 (6144--13975)
// XPNDR LIMITS = 0000-7777		(Octal system)
// ADF LIMITS   = 0100.0-1799.9

	init_environment(); LCD_1_Start(); LCD_1_InitBG(LCD_1_LINE_BG); //init_cgram();
 
   LCD_1_Position(0,0);
   LCD_1_PrCString("  RUDDER  TRIM  ");

	
 	while(1)  {
			//txBuffer[0]=

			I2Oku();
//DIKKAT REMARKLI SATIRLAR ALPS marka ICIN KONULDU. HEM HIGH HEM LOW DARBESI ICIN
			dummy1 = PRT3DR^lastport;	//durumu degisen pin varmi?

			if (dummy1 & BSET_0) {		//0. pinin durumu degismis
				lastport=PRT3DR;
				switch  (PRT3DR & 0b00000011) {	//bu encoder hangi yone donuyor?
						case 1: 
									if (ekran_res[0]==3) {} else {ekran_res[0]--; }
								break;
						case 3: 
									if (ekran_res[0]==255) {} else {ekran_res[0]++; }
								break;
						
						}}
			if (dummy1 & BSET_2) {		//2. pinin durumu degismis
				lastport=PRT3DR;
				switch  (PRT3DR & 0b00001100) {	//bu encoder hangi yone donuyor?
						
						case 4: 
									if (ekran_res[0]==3) {} else {ekran_res[0]--; }
								break;
						
						case 12: 
									if (ekran_res[0]==255) {} else {ekran_res[0]++; }
								break;
						
						}}
						
				LCD_1_DrawBG(1,0,16,ekran_res[0]/3);
//   LCD_1_Position(1,5);
//   LCD_PrintInt(ekran_res[0]);
				
			txBuffer[0]=ekran_res[0];
			txBuffer[1]=0;				//buton toggle vs...
						
			I2Yaz();

	
}//while kapa	
}//main kapa

void dly(long int mS){init_delay_counter(mS,mS/2); while (DELAY_INVOKE);{}}

void I2Yaz()
{
		status = I2CHW_1_bReadI2CStatus();
		if( status & I2CHW_RD_COMPLETE )
		{
			I2CHW_1_ClrRdStatus();
			I2CHW_1_InitRamRead(txBuffer,32);}}

void I2Oku()
{
        status = I2CHW_1_bReadI2CStatus();  
        if( status & I2CHW_WR_COMPLETE )  
        {
	        I2CHW_1_ClrWrStatus();  
	        I2CHW_1_InitWrite(rxBuffer,32);}}
	        
void clrdisp(){LCD_1_Position(0,0);LCD_1_PrCString("                ");LCD_1_Position(1,0);LCD_1_PrCString("                ");}
void disp_msg(BYTE line, BYTE row, char *msgm){LCD_1_Position(line,row);LCD_1_PrString(msgm);}

void LCD_PrintInt(int val) 
{char *intRet; itoa(intRet, val, 10 ); LCD_1_PrString(intRet);}

void LCD_PrintFloat(float vall)
{
int statuss;
int i = 0;
char *floatRet;

floatRet = ftoa(vall + 0.005, &statuss);
while(floatRet[i]){
if('.' == floatRet[i])
break;
i++;
}
floatRet[i+3] = '\0';
LCD_1_PrString(floatRet);}