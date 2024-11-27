section .data
message db "La suma de los valores es: ", 0
newline db 10, 0 ; Nueva línea para la salida
section .bss
buffer resb 4 ; Buffer para convertir números a caracteres
section .text
global _start
%macro DEFINE_VALUES 3
; Define una "estructura" con tres valores
val1 db %1 ; Primer valor
val2 db %2 ; Segundo valor
val3 db %3 ; Tercer valor
%endmacro
%macro PRINT_STRING 1
mov eax, 4 ; Syscall número para 'write'
mov ebx, 1 ; File descriptor para stdout
mov ecx, %1 ; Dirección del mensaje
mov edx, 25 ; Longitud del mensaje
int 0x80
%endmacro
%macro PRINT_NUMBER 1
; Convierte un número en eax a caracteres ASCII y lo imprime
mov eax, %1
mov ecx, buffer ; Usamos el buffer para guardar el resultado
mov ebx, 10 ; Divisor para obtener dígitos decimales
.next_digit:
xor edx, edx ; Limpia edx para la división
div ebx ; Divide eax entre 10, cociente en eax, residuo en edx
add dl, '0' ; Convierte el dígito a ASCII
dec ecx ; Mueve hacia atrás en el buffer

mov [ecx], dl ; Almacena el dígito en el buffer
test eax, eax ; Verifica si quedan dígitos
jnz .next_digit ; Si quedan dígitos, continúa
; Imprime el número
mov eax, 4 ; Syscall para write
mov ebx, 1 ; Salida estándar
mov ecx, buffer ; Comienza en el primer dígito
mov edx, buffer + 4 ; Longitud máxima asumida en 4 dígitos
sub ecx, edx ; Calcula la longitud real
int 0x80
%endmacro
%macro PRINT_SUM 0
; Realiza la suma de tres valores y la imprime
mov al, [val1] ; Carga el primer valor en AL
add al, [val2] ; Suma el segundo valor
add al, [val3] ; Suma el tercer valor
movzx eax, al ; Expande AL a EAX para asegurar un valor de 32 bits
; Imprime el resultado de la suma
PRINT_NUMBER eax
PRINT_STRING newline
%endmacro
; Definimos los tres valores con la macro DEFINE_VALUES
DEFINE_VALUES 3, 5, 7
_start:
; Imprime el mensaje inicial
PRINT_STRING message
; Imprime la suma de los valores
PRINT_SUM
; Salir del programa
mov eax, 1 ; Syscall para 'exit'
mov ebx, 0 ; Código de salida
int 0x80