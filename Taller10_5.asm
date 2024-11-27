section .data
count db 10
section .text

; Inicializa count
mov count, 10
for_loop:
CMP count, 1
JL end_loop ; Termina si count < 1

; Aquí iría la instrucción de impresión o almacenamiento
DEC count ; Decrementa count
JMP for_loop ; Repite el ciclo
end_loop:
; Aquí termina el bucle