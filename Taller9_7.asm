section .text
global _start

_start:
mov ah, 0 ; Inicialización
int 17h ; Interrupción para impresora

; Terminar el programa
mov ax, 4C00h
int 21h