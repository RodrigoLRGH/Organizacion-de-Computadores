section .data
mensaje_entrada db "Ingrese una cadena en minusculas: ", 0
longitud_mensaje_entrada equ $ - mensaje_entrada
cadena_salida db 50 dup(0) ; Buffer para la cadena de salida
mensaje_resultado db "Cadena en mayusculas: ", 0
nueva_linea db 10, 0
section .text
global _start
_start:
; Mostrar el mensaje de entrada
mov eax, 4 ; syscall: write
mov ebx, 1 ; file descriptor: stdout
mov ecx, mensaje_entrada ; mensaje a escribir
mov edx, longitud_mensaje_entrada ; longitud del mensaje
int 0x80 ; llamada al sistema
; Leer la entrada del usuario
mov eax, 3 ; syscall: read
mov ebx, 0 ; file descriptor: stdin
mov ecx, cadena_salida ; buffer para almacenar la entrada
mov edx, 50 ; longitud máxima
int 0x80 ; llamada al sistema
; Convertir a mayúsculas
mov esi, cadena_salida ; puntero a la cadena de entrada
mov edi, cadena_salida ; puntero a la cadena de salida (misma dirección)
convertir_loop:
mov al, [esi] ; cargar el carácter actual
cmp al, 0 ; comprobar si es el final de la cadena
je imprimir_resultado ; si es 0, saltar a imprimir resultado
; Convertir minúsculas a mayúsculas
cmp al, 'a' ; comparar con 'a'
jb saltar_conversion ; si es menor, saltar
cmp al, 'z' ; comparar con 'z'
ja saltar_conversion ; si es mayor, saltar
sub al, 32 ; convertir a mayúscula (a-z a A-Z)

saltar_conversion:
mov [edi], al ; almacenar el carácter convertido
inc esi ; avanzar al siguiente carácter
inc edi ; avanzar en la cadena de salida
jmp convertir_loop ; repetir el bucle
imprimir_resultado:
; Terminar la cadena de salida
mov byte [edi], 0 ; agregar terminador nulo
; Mostrar la nueva línea
mov eax, 4 ; syscall: write
mov ebx, 1 ; file descriptor: stdout
mov ecx, nueva_linea ; nueva línea
mov edx, 1 ; longitud de la nueva línea
int 0x80 ; llamada al sistema
; Mostrar la cadena convertida
mov eax, 4 ; syscall: write
mov ebx, 1 ; file descriptor: stdout
mov ecx, mensaje_resultado ; mensaje de resultado
mov edx, 26 ; longitud del mensaje
int 0x80 ; llamada al sistema
mov eax, 4 ; syscall: write
mov ebx, 1 ; file descriptor: stdout
mov ecx, cadena_salida ; cadena convertida
mov edx, 50 ; longitud máxima de la cadena
int 0x80 ; llamada al sistema
; Terminar el programa
mov eax, 1 ; syscall: exit
xor ebx, ebx ; código de salida 0
int 0x80 ; llamada al sistema