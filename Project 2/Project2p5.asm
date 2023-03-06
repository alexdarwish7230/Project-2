#include <P18F4620.inc>
 config OSC = INTIO67
 config WDT = OFF
 config LVP = OFF
 config BOREN = OFF
Delay1 equ 0xFF
Delay2 equ 0XFF 
Counter_L equ 0x20
Counter_H equ 0x21
Color_Value equ 0x28
Loop_Count equ 0x29
D2_D3_Start_Value equ 0x50
 ORG 0x0000
; CODE STARTS FROM THE NEXT LINE
START:
 ORG 0x0000;				    ORG defines where the machine code is to place in memory, which is placed in 0x0000
START:
;TABLE DB 0x85,0xA7,0xE3,0x06,0x21,0x62,0xC4,0x40
 MOVLW 0x0F ;				    Move literal value 0x0F to the W register
 MOVWF ADCON1 ;				    Move data from W to register 'f' for A-D converter on ADCON1
 MOVLW 0x00 ;				    Move literal value 0x00 to the W register
 MOVWF TRISC ;				    Move data from W to register 'f' for A-D converter on TRISC
 MOVWF TRISD;				    Move data from W to register 'f' for A-D converter on TRISD
 MOVLW 0x85;				    Move literal value 0x85 to the W register
 MOVWF D2_D3_Start_Value;		    Move data from W to register 'f' for A-D converter on D2_D3_Start_Value
 MOVLW 0xA7;				    Move literal value 0xA7 to the W register
MOVWF D2_D3_Start_Value+1;		    Move data from W to register 'f' for A-D converter on D2_D3_Start_Value+1
  MOVLW 0xE3;				    Move literal value 0xE3 to the W register
 MOVWF D2_D3_Start_Value+2;		    Move data from W to register 'f' for A-D converter on D2_D3_Start_Value+2
 MOVLW 0x06;				    Move literal value 0x06 to the W register
 MOVWF D2_D3_Start_Value+3;		    Move data from W to register 'f' for A-D converter on D2_D3_Start_Value+3
  MOVLW 0x21;				    Move literal value 0x21 to the W register
 MOVWF D2_D3_Start_Value+4;		    Move data from W to register 'f' for A-D converter on D2_D3_Start_Value+4
  MOVLW 0x62;				    Move literal value 0x62 to the W register
 MOVWF D2_D3_Start_Value+5;		    Move data from W to register 'f' for A-D converter on D2_D3_Start_Value+5
  MOVLW 0xC4;				    Move literal value 0xC4 to the W register
 MOVWF D2_D3_Start_Value+6;		    Move data from W to register 'f' for A-D converter on D2_D3_Start_Value+6
  MOVLW 0x40;				    Move literal value 0x40 to the W register
 MOVWF D2_D3_Start_Value+7;		    Move data from W to register 'f' for A-D converter on D2_D3_Start_Value+7
WHILE_LOOP: ;
 LFSR 0,D2_D3_Start_Value;		    12 bit literal 'k' is loaded into the File Select Register pointed to by 'f'
 MOVLW 0x00 ;				    Move literal value 0x00 to the W register
 MOVWF Color_Value ;			    Move data from W to register 'f' for A-D converter on Color_Value
 MOVLW 0x08 ;				    Move literal value 0x08 to the W register
 MOVWF Loop_Count ;			    Move data from W to register 'f' for A-D converter on Loop_Count

FOR_LOOP:
 MOVF Color_Value,W ;			    Move contents of register 'f' are moved to a destination dependent upon the status of 'd'.
 MOVWF PORTC ;				    Move data from W to register 'f' for A-D converter on PORTC
 MOVF INDF0,W;				    Move contents of register 'f' are moved to a destination dependent upon the status of 'd'.
 MOVWF PORTD;				    Move data from W to register 'f' for A-D converter on PORTD
 CALL DELAY_ONE_SEC ;			    Procedure named DELAY_ONE_SEC in the operand is to be executed
 
 INCF Color_Value,F ;			    Increment register 'f'. If d is '0', the result is stored in W. If 'd' is '1'. 
		    ;			    The result is stored back in register 'f'.
		    
 INCF FSR0L;				    Increment register 'f'. If d is '0', the result is stored in W. If 'd' is '1'. 
		    ;			    The result is stored back in register 'f'.
			
 INCF FSR1L;				    Increment register 'f'. If d is '0', the result is stored in W. If 'd' is '1'. 
		    ;			    The result is stored back in register 'f'.
		    
 DECF Loop_Count,F ;			    Decrement register 'f'. If d is '0', the result is stored in W. If 'd' is '1'. 
		    ;			    The result is stored back in register 'f'.
		    
 BNZ FOR_LOOP ;				    Branch if not zero. If the Zero bit is '0', then the program will branch.

 
 GOTO WHILE_LOOP ;			    GOTO is an instruction that goes to address WHILE_LOOP
DELAY_ONE_SEC:
MOVLW Delay1 ;				    Move literal value 'Delay1' to the W register
MOVWF Counter_H ;			    Move data from W to register 'f' for A-D converter on Counter_H
LOOP_OUTER:
NOP ;
MOVLW Delay2 ;				    Move literal value 'Delay1' to the W register
MOVWF Counter_L ;			    Move data from W to register 'f' for A-D converter on Counter_L
LOOP_INNER:
NOP ;
DECF Counter_L,F ;			    Decrement register 'f'. If d is '0', the result is stored in W. If 'd' is '1'. 
		    ;			    The result is stored back in register 'f'. 
		    
BNZ LOOP_INNER ;			    Branch if not zero. If the Zero bit is '0', then the program will branch.
DECF Counter_H,F ;			    Decrement register 'f'. If d is '0', the result is stored in W. If 'd' is '1'. 
		    ;			    The result is stored back in register 'f'.  
		    
BNZ LOOP_OUTER ;			    Branch if not zero. If the Zero bit is '0', then the program will branch.
RETURN			    

 END 





