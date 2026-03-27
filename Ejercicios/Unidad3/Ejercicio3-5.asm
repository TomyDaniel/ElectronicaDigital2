#include "p16f887.inc"
    
valA EQU .249
contador EQU 0x20
 
ORG 0x00
 
INICIO
    
    MOVLW valA
    MOVWF contador
    
LOOP
    
    DECFSZ contador, f	; Voy a contador, le resto 1 y lo vuelvo a guardar ahi (f). Luego chequeo si es 0
    GOTO LOOP
    GOTO INICIO
    END
