section .text
global _start

_start:
mov ah, 01h ; Función para leer un carácter
int 21h ; Llamar a la interrupción DOS
mov ah, 4Ch ; Terminar el programa
int 21h