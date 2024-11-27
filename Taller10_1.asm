section .data
sum db 0
count db 1
section .text
; Inicializa sum y count
mov sum, 0
mov count, 1

while_loop:
CMP count, 10
JG end_loop ; Termina el bucle si count > 10
ADD sum, count ; Suma count a sum
INC count ; Incrementa count
JMP while_loop ; Repite el ciclo
end_loop:
; Aquí termina el bucle