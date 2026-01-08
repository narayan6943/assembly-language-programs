section .data
    num1 db 5
    num2 db 7
    msg db 'Sum: ', 0
    msg_len equ $ - msg
    result db 0, 0    ; space for 2-digit result

section .text
    global _start

_start:
    ; Calculate sum
    mov al, [num1]
    add al, [num2]
    mov bl, al          ; store sum in bl

    ; Convert sum to string
    mov ah, 0
    mov cl, 10
    div cl              ; al = sum / 10, ah = sum % 10
    add al, '0'         ; tens digit ASCII
    mov [result], al
    add ah, '0'         ; ones digit ASCII
    mov [result+1], ah

    ; Print message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msg_len
    int 0x80

    ; Print result
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 2
    int 0x80

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
