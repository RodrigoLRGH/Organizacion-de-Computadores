section .data
product db 1
i db 1
section .text

; Inicializa product y i
mov product, 1
mov i, 1
for_loop:
CMP i, 5
JG end_loop ; Termina el bucle si i > 5

; Multiplica product por i
mov al, product
MUL i
mov product, al
INC i ; Incrementa i
JMP for_loop ; Repite el ciclo
end_loop:
; Aquí termina el bucle