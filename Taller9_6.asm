section .text
global _start

_start:
mov ah, 09h ; Función para imprimir cadena

mov dx, message ; Mensaje a imprimir
int 21h

; Terminar el programa
mov ax, 4C00h
int 21h

section .data
message db 'Hola, mundo!', 0