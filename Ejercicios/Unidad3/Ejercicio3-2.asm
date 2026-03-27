#include "p16f887.inc"

datoA EQU 0x21
datoB EQU 0x22
datoRes EQU 0x23
datoCarry EQU 0x24

ORG 0x00

INICIO

    MOVF datoB, W       ; Muevo el dato B a W
    ADDWF datoA, W      ; Muevo el dato A a W y sumo A + B 
    MOVWF datoRes       ; Guardo el resultado de la suma

    CLRF datoCarry   

    BTFSC STATUS, C     ; Chequeo si hubo carry 
    INCF datoCarry, f   ; Si C=1, no salta de linea y sumo 1 a carry
