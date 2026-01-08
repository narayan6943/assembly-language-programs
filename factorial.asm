section .data
    n db 5
    result db 1
    msg db 'Factorial: ', 0
    msg_len equ $ - msg

section .text
    global _start

_start:
    mov al, [n]
    mov bl, al          ; copy n
    dec bl              ; loop counter = n-1

factorial_loop:
    cmp bl, 0
    je factorial_done
    mov ah, al
    mul bl
    mov al, al          ; store lower 8 bits of result
    dec bl
    jmp factorial_loop

factorial_done:
    mov [result], al

    ; print message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msg_len
    int 0x80

    ; print result as char
    mov al, [result]
    add al, '0'
    mov [result], al
    mov eax, 4
    mov ebx, 1
    lea ecx, [result]
    mov edx, 1
    int 0x80

    ; exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
