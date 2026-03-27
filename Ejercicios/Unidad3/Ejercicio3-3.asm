#include "p16f887.inc"
    
datoA EQU 0x21
datoB EQU 0x22
datoC EQU 0x23
 
ORG 0x00

INICIO
    
    MOVF datoA, W	; Busco en datoA el valor y lo cargo en W
    ADDWF datoB, W	; Sumo el datoA y busco el datoB y lo sumo y el resultado queda en W
    
    MOVWF datoA		; Copio el resultado de la suma de W a f
    
    CLRW		; Limpio W
    
    MOVF datoC, W	; Busco el datoC y lo muevo a W
    SUBWF datoA, W	; Agrego la suma a W y le resto el datoC
    