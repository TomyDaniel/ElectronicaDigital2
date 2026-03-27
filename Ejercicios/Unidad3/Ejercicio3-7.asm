#include "p16f887.inc"
    
datoA EQU 0x1E
datoB EQU 0x1F
datoR EQU 0x20
 
ORG 0x00
 
INICIO
 
    MOVF datoB, W   :	; Muevo el datoB a W
    SUBWF datoA, W	; Muevo el datoA a W. (A - B)
    
    BTFSC STATUS, Z	; Chequeo primeramente la bandera Z (Zero)
    GOTO iguales	; Voy hacia mmi funcion
    
    BTFSC STATUS, C	; Chequeo la bandera C (Carry)
    GOTO AmayB
    
    BTFSS STATUS, C
    GOTO AmenB
    
iguales
    CALL son_iguales	; Llamo a la subrutina para cargar el resultado
    GOTO FIN
    
AmayB
    CALL AmayorB	; Llamo a la subrutina para cargar el resultado
    GOTO FIN
    
AmenB
    CALL AmenorB	; Llamo a la subrutina para cargar el resultado
    GOTO FIN
    
FIN
    GOTO FIN

    
son_iguales
    MOVLW .0		; Cargo el valor 0 en W
    MOVWF datoR		; Cargo ese valor 0 en mi resultado
    RETURN
    
AmayorB 
    MOVF datoB, W	; Cargo B en W
    SUBWF datoA, W	; Cargo A en W y resto A - B
    MOVWF datoR		; Guardo el resultado en R
    RETURN
    
AmenorB
    MOVF datoB, W	; Cargo B en W
    ADDWF datoA, W	; Cargo A en W y resto A - B
    MOVWF datoR		; Guardo el resultado en R
    RETURN
