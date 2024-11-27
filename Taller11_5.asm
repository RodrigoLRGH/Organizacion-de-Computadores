section .data
num1 db 5 ; Definir un byte con el valor 5
num2 db 11 ; Definir un byte con el valor 11
result db 0 ; Almacena el resultado de la suma
message db "Resultado: ", 0 ; Mensaje a mostrar antes del resultado
section .bss
buffer resb 4 ; Reservar espacio para almacenar un carácter de resultado
section .text
global _start
; Macro para imprimir una cadena de texto
%macro PRINT_STRING 1

mov eax, 4 ; Llamada al sistema para escribir (syscall write)
mov ebx, 1 ; Escribir en la salida estándar (stdout)
mov ecx, %1 ; Dirección de la cadena a imprimir
mov edx, 13 ; Longitud de la cadena (en este caso, 13 caracteres)
int 0x80 ; Llamada al sistema
%endmacro

; Macro para imprimir un número de un solo dígito
%macro PRINT_NUMBER 1
mov eax, %1 ; Mover el valor del número en eax
add eax, '0' ; Convertir el número a su carácter ASCII
mov [buffer], eax ; Guardar el carácter en el buffer
mov eax, 4 ; Llamada al sistema para escribir
mov ebx, 1 ; Escribir en la salida estándar (stdout)
mov ecx, buffer ; Dirección del buffer
mov edx, 1 ; Tamaño de la impresión (1 carácter)
int 0x80 ; Llamada al sistema
%endmacro

_start:
; Realizar la suma de los números
mov al, [num1] ; Cargar el valor de num1 en el registro AL
add al, [num2] ; Sumar el valor de num2 al contenido de AL
mov [result], al ; Guardar el resultado en la variable result
; Imprimir el mensaje "Resultado: "
PRINT_STRING message
; Imprimir el resultado de la suma
PRINT_NUMBER [result]
; Salir del programa
mov eax, 1 ; Llamada al sistema para salir (syscall exit)
mov ebx, 0 ; Código de salida (0: éxito)
int 0x80 ; Llamada al sistema