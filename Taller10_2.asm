section .data
list db 5, 3, 7, -1 ; Lista de números
sum db 0

section .text
; Inicializa sum y puntero a la lista
mov sum, 0
mov si, list
do_while_loop:
mov al, [si] ; Carga el número en AL
ADD sum, al ; Añade el número a sum
CMP al, 0
JS end_loop ; Termina si el número es negativo
INC si ; Avanza al siguiente número
JMP do_while_loop ; Repite el ciclo
end_loop:
; Aquí termina el bucle