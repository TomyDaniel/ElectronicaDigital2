#include "p16f887.inc"
    
dir EQU 0x20
helperCen EQU 0x21
helperDec EQU 0x22
helperUni EQU 0x23
trash EQU 0x24
 
; BCD desempaquetado con 8 bits
; Tengo hasta el 255 como posibilidad
 
ORG 0x00
 
INICIO
    
    MOVF dir, W		; Cargo en W mi valor
    MOVWF trash		; Llevo el valor de W a trash
        
    MOVLW .100		; Cargo 100 en W
    
    SUBWF dir, W	; Resto dir - 100 para saber si tengo centenas o no
    
    BTFSS STATUS, C	; Me fijo el resultado de la resta, si es uno no salta, si es cero salta
    GOTO TRES_DIGITOS	; Voy a mi funcion
    GOTO DOS_DIGITOS	; Voy a mi funcion
    
DOS_DIGITOS
    
    CALL cargo2num	; Llamo a la subrutina cuando no tengo centenas
    CALL cargoUni	; Llamo a la subrutina luego de procesar las decenas
    
TRES_DIGITOS
    
    CALL cargo3num	; Llamo a la subrutina para procesar centenas
    CALL cargo2num	; Llamo a la subrutina para procesar decenas
    CALL cargoUni	; Llamo a la subrutina para procesar unidades

cargoUni:
    
    CLRF helperUni	; Limpio
    
    MOVLW .1		; Cargo 1 en W
    SUBWF trash, F	; Resto el numero - 1
    
    BTFSS STATUS, C	; Chequeo si se activo el carry, eso se significa que trash es mas chico que 1
    GOTO finUni		; Si C=0 no se pudo restar, entonces entro a la instruccion
    
    INCF helperUni, F	; Si C=1 se pudo restar y sumo 1 a las unidades
    GOTO cargoUni	; Si no es mas chico vuelvo
    
cargo2num:
    
    CLRF helperDec
    
    MOVLW .10		; Cargo 10 en W
    SUBWF trash, F	; Resto el numero - 10
    
    BTFSS STATUS, C	; Chequeo si se activo el carry, eso se significa que trash es mas chico que 10
    GOTO finDec
    
    INCF helperDec, F
    GOTO cargo2num	; Si no es mas chico vuelvo
    
cargo3num:
    
    CLRF helperCen
    
    MOVLW .100		; Cargo 100 en W
    SUBWF trash, F	; Resto el numero - 100
    
    BTFSS STATUS, C	; Chequeo si se activo el carry, eso se significa que trash es mas chico que 100
    GOTO finCen
    
    INCF helperCen, F
    GOTO cargo3num	; Si no es mas chico vuelvo
    
finUni
    
    MOVLW .1
    ADDWF trash, F
    return
    
finDec
    
    MOVLW .10
    ADDWF trash, F
    return

finCen
    
    MOVLW .100
    ADDWF trash, F
    return
    