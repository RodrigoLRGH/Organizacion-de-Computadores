section .data
    msg db 'Resultado: ', 0
    newline db 0xA

section .bss
    res resb 4           ; Espacio para el resultado

section .text
    global _start

_start:
    mov eax, 10
    mov ebx, 5
    add eax, ebx         ; 10 + 5 = 15

    and eax, 0xF         ; 15 no es mayor que 15, por lo que sigue siendo 15

    shl eax, 1           ; 15 * 2 = 30

    mov [res], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 11
    int 0x80

    mov eax, [res]
    add eax, '0'         ; 0 (48) + 30 = 78 (EL valor de N en ASCII)
    mov [res], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
