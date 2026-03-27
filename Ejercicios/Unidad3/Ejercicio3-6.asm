#include "p16f887.inc"
    
valA EQU .249
valB EQU .138
valC EQU .9
contadorA EQU 0x20
contadorB EQU 0x21
contadorC EQU 0x22
 
ORG 0x00
 
LOOP_EXTERNO
    MOVLW .9          
    MOVWF contadorC

LOOP_MEDIO
    MOVLW .138         
    MOVWF contadorB

LOOP_INTERNO
    MOVLW .249       
    MOVWF contadorA

DELAY_A
    DECFSZ contadorA, f
    GOTO DELAY_A   

    DECFSZ contadorB, f
    GOTO LOOP_INTERNO

    DECFSZ contadorC, f 
    GOTO LOOP_MEDIO
