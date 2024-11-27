section .data
num1 db 22               ; Define el primer numero como 5
num2 db 22              ; Define el segundo numero como 11
result db 0             ; Espacio para almacenar el resultado de la suma
msg db 'Resultado: ', 0 ; El mensaje que se mostrara antes del resultado

section .bss
buffer resb 4           ; Espacio para almacenar el resultado

section .text
global _start           ; Punto de entrada del programa

_start:
    mov al, [num1]      ; Carga el num1 en el registro AL
    add al, [num2]      ; Suma el valor de num2 al valor que ya esta en AL
    mov [result], al    ; Almacena el resultado en la variable result

    ; Convertir el resultado a ASCII
    movzx eax, byte [result] ; Mueve el valor result a EAX
    add eax, 48              ; Convertir el valor numérico en su correspondiente ASCII ('0' = 48)
    mov [buffer], al         ; Almacenar el carácter ASCII en el buffer

    mov eax, 4           ; Llamada al sistema
    mov ebx, 1           ; Escribe en la salida estándar
    mov ecx, msg         ; Dirección del mensaje que se quiere mostrar
    mov edx, 11          ; Da la longitud del mensaje
    int 0x80             ; Interrupción para realizar la llamada al sistema

    mov eax, 4           ; Llamada al sistema
    mov ebx, 1           ; Escribir en la salida estándar
    mov ecx, buffer      ; Dirección del buffer que contiene el resultado
    mov edx, 1           ; Longitud del resultado
    int 0x80             ; Interrupción para realizar llamada al sistema

    mov eax, 1           ; Llamada al sistema
    xor ebx, ebx         ; Código de salida 0
    int 0x80             ; Interrupción para realizar llamada al sistema
