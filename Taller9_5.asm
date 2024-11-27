section .text
global _start

_start:
mov ah, 02h ; Función de lectura de disco
mov al, 01h ; Leer 1 sector
mov ch, 0 ; Cabezal 0
mov cl, 2 ; Sector 2
mov dh, 0 ; Cilindro 0
mov bx, 0x7C00 ; Dirección de destino
int 13h ; Llamar a la interrupción del disco

; Terminar el programa
mov ax, 4C00h
int 21h