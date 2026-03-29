#include "p16f887.inc"
    
nroSave EQU .33
firstDir EQU 0x30

registro EQU 0x20
contador EQU .15
 
ORG 0x00
 
INICIO
    
    MOVLW firstDir	; Cargo la direccion a W
    MOVWF FSR		; Muevo esa direccion al FSR, funciona como un puntero
    
    MOVLW nroSave	; Cargo en W el valor que quiero que tenga mi direccion de memoria
    MOVWF INDF		; Muevo ese valor a mi direccion apuntada "firstDir"
    
    MOVLW contador	; Muevo mi valor contador a W
    MOVWF registro	; Cargo en registro mi valor contador
    
LOOP
    
    DECFSZ registro, f	; Decremento uno a mi contador
    GOTO GUARDAR	; Llamo a guardar para cargar mi nuemero en la siguiente direccion de memoria
    GOTO FIN		; Si llega el contador a cero, termina el programa

GUARDAR
    
    INCF FSR, F		; Muevo el puntero una direccion
    MOVLW nroSave	; Cargo el W el valor a guardar
    MOVWF INDF		; Muevo a la direccion apuntada mi valor a guardar
    GOTO LOOP		; Si no es cero el contador vuelvo
    
FIN
    END
    