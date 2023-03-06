; THIS SECOND ASSEMBLY LANGUAGE PROGRAM WILL READ THE VALUES OF
; ALL THE BITS 0-3 OF PORT A AND OUTPUT THEM
; TO THE PINS 0 THROUGH 3 OF PORT B
#include <P18F4620.inc>
 config OSC = INTIO67
 config WDT = OFF
 config LVP = OFF
 config BOREN = OFF
 ORG 0x0000 ;ORG defines where the machine code is to place in memory, which is placed in 0x0000
START:
 MOVLW 0x0F ;			Move literal value 0x0F to the W register 
 MOVWF ADCON1 ;			Move data from W to register 'f' for A-D converter on ADCON1
 MOVLW 0xFF ;			Move literal value 0xFF to the W register
 MOVWF TRISA ;			Move data from W to register 'f' for the Data Direction Register for TRISA
 MOVLW 0x00 ;			Move literal value 0x00 to the W register 
 MOVWF TRISB ;			Move data from W to register 'f' for the Data Direction Register for TRISB
MAIN_LOOP: ;
 MOVF PORTA, W ;		Move contents of register 'f' are moved to a destination dependent upon the status of 'd'.
 ANDLW 0x0F ;			Contents of W are ANDed with the 8-bit lateral 'k'. The result is placed in W.
 MOVWF PORTB ;			Move data from W to register 'f' for the Data Direction Register for PORTB
 GOTO MAIN_LOOP ;		GOTO is an instruction that goes to address MAIN_LOOP
 END 


