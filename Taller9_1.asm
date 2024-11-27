section .text
global _start

_start:
xor ax, ax ; AX = 0
xor bx, bx ; BX = 0
div bx ; División por cero (esto causará un error)

; Manejo de la interrupción (generalmente no alcanzado)
jmp $ ; Loop infinito

section .data