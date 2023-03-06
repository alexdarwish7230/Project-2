; THIS FIRST ASSEMBLY LANGUAGE PROGRAM WILL FLASH LEDS
; CONNECTED TO THE PINS 0 THROUGH 3 OF PORT B
#include<P18F4620.inc>
config OSC = INTIO67
config WDT = OFF
config LVP = OFF
config BOREN = OFF
; Constant declarations
Delay1 equ 0xFF			;Make constant Delay1 equal to 1		;
Delay2 equ 0XFF			;Make constant Delay2 equal to 1
Counter_L equ 0x20		;Make constant Counter_L equal to 0x20
Counter_H equ 0x21		;Make constant Counter_H equal to 0x21
ORG 0x0000			;ORG defines where the machine code is to place in memory, which is placed in 0x0000
 ; CODE STARTS FROM THE NEXT LINE
START:
MOVLW 0x0F ;			Move literal value 0x0F to the W register 
MOVWF ADCON1 ;			Move data from W to register 'f' for A-D converter on ADCON1
MOVLW 0x00 ;			Move literal value 0x00 to the W register
MOVWF TRISB ;			Move data from W to register 'f' for the Data Direction Register for TRISB
MAIN_LOOP:
MOVLW 0x05 ;			Move literal value 0x05 to the W register
MOVWF PORTB ;			Move data from W to register 'f' for the bidirectional I/O port (PORTB) 
;   
CALL DELAY_ONE_SEC ;		Procedure named DELAY_ONE_SEC in the operand is to be executed
MOVLW 0x0A ;			Move literal value 0x0A to the W register
MOVWF PORTB ;			Move data from W to register 'f' for the bidirectional I/O port (PORTB) 
CALL DELAY_ONE_SEC ;		Procedure named DELAY_ONE_SEC in the operand is to be executed
GOTO MAIN_LOOP ;		GOTO is an instruction that goes to address MAIN_LOOP
DELAY_ONE_SEC:;			
MOVLW Delay1 ;			Move literal value Delay1 to the W register
MOVWF Counter_H ;		Move data from W to register 'f' for the bidirectional I/O port (Counter_H) 
LOOP_OUTER:
NOP ;
MOVLW Delay2 ;			Move literal value Delay2 to the W register
MOVWF Counter_L ;		Move data from W to register 'f' for the bidirectional I/O port (Counter_L) 
LOOP_INNER:
NOP ;
DECF Counter_L,F ;		Decrement register 'f'. If d is '0', the result is stored in W. If 'd' is '1'. 
    ;				The result is stored back in register 'f'.
    
BNZ LOOP_INNER ;		Branch if not zero. If the Zero bit is '0', then the program will branch.
DECF Counter_H,F ;		Decrement register 'f'. If d is '0', the result is stored in W. If 'd' is '1'. 
    ;				The result is stored back in register 'f'.
    
BNZ LOOP_OUTER ;		Branch if not zero. If the Zero bit is '0', then the program will branch.
RETURN				
 END 


