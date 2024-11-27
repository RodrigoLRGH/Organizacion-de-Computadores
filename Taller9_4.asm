section .text
global _start

_start:
int 5 ; Llamar a la interrupción para imprimir la pantalla

; Terminar el programa
mov ax, 4C00h
int 21h