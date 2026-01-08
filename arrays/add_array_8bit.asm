; Program: Add array of 8-bit numbers
; Processor: 8086

.model small
.stack 100h

.data
    arr db 10h, 20h, 30h, 40h
    count db 4
    sum dw 0000h

.code
start:
    mov ax, @data
    mov ds, ax

    xor ax, ax
    xor bx, bx
    mov cl, count

next:
    mov al, arr[bx]
    add sum, ax
    inc bx
    loop next

    mov ah, 4Ch
    int 21h
end start
