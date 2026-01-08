; Program: Add array of 16-bit numbers
; Processor: 8086

.model small
.stack 100h

.data
    arr dw 1000h, 2000h, 3000h, 4000h
    count db 4
    sum_low  dw 0000h
    sum_high dw 0000h

.code
start:
    mov ax, @data
    mov ds, ax

    xor bx, bx
    mov cl, count

next:
    mov ax, arr[bx]
    add sum_low, ax
    jnc skip
    inc sum_high

skip:
    add bx, 2
    loop next

    mov ah, 4Ch
    int 21h
end start
