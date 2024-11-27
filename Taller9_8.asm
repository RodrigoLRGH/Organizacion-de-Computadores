section .text
global _start

_start:
; Simulación de Control C
; Este código está destinado a terminar el programa
int 23h ; Interrupción de Control C (interrupción de software)

; Terminar el programa
mov ax, 4C00h
int 21h