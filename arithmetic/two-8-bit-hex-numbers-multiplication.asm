; multiplication.asm
section .data
    num1 db 0x03
    num2 db 0x04
    result dw 0        ; 16-bit result

section .text
    global _start

_start:
    mov al, [num1]     ; Load first number
    mov bl, [num2]     ; Load second number
    mul bl             ; AL * BL -> AX
    mov [result], ax   ; Store result
    hlt

