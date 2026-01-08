section .data
    msg db 'Hello, Assembly!', 0xA   ; message with newline
    msg_len equ $ - msg               ; length of message

section .text
    global _start

_start:
    mov eax, 4        ; sys_write
    mov ebx, 1        ; stdout
    mov ecx, msg      ; message address
    mov edx, msg_len  ; message length
    int 0x80          ; call kernel

    mov eax, 1        ; sys_exit
    xor ebx, ebx      ; exit code 0
    int 0x80          ; call kernel
