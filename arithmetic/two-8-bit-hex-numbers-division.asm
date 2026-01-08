; division.asm
section .data
    dividend db 0x12
    divisor  db 0x05
    quotient db 0
    remainder db 0

section .text
    global _start

_start:
    mov al, [dividend] ; Load dividend
    mov bl, [divisor]  ; Load divisor
    xor ah, ah         ; Clear AH for div
    div bl             ; AL / BL -> AL=quotient, AH=remainder
    mov [quotient], al
    mov [remainder], ah
    hlt
