; subtraction.asm
section .data
    num1 db 0x3C
    num2 db 0x12
    result db 0

section .text
    global _start

_start:
    mov al, [num1]     ; Load first number
    sub al, [num2]     ; Subtract second number
    mov [result], al   ; Store result
    hlt
