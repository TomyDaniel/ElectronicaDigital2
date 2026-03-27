#include "p16f887.inc"

numA_Low EQU 0x20
numA_High EQU 0x21
numB_Low EQU 0x22
numB_High EQU 0x23

ORG 0x00
 
INICIO
 
    MOVF numA_Low, W	; Muevo el valor A a W
    ADDWF numB_Low, W	; Muevo el valor B a W y le sumo A
    MOVWF numA_Low	; Muevo el resultado de la suma a numA_Low
    
    MOVF numA_High, W	; Muevo el numA a W
    BTFSC STATUS, c	; Chequeo si hay carry al realizar la suma
    ADDLW 1		; Si hay carry sumo 1 a W
    
    ADDWF numB_High, W	; Muevo el numb a W y le sumo el numA
    MOVWF numA_High	; Muevo el resultado a numA
