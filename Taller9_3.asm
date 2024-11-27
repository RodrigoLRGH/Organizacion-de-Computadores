global _start

_start:
cli ; Deshabilitar interrupciones
mov ah, 00h ; Inicialización
int 08h ; Llamar al temporizador (en un bucle normal)
sti ; Habilitar interrupciones

; Loop infinito
jmp $