section .data
num db 3
result_even db 0
result_odd db 0
section .text

; Carga el valor de num y verifica paridad
mov al, num
TEST al, 1 ; Verifica si el bit menos significativo es 0
JZ is_even ; Salta a is_even si num es par

; Si es impar
mov result_odd, 1 ; Almacena el resultado en result_odd
JMP end_if
is_even:
mov result_even, 1 ; Almacena el resultado en result_even
end_if:
; Fin del condicional