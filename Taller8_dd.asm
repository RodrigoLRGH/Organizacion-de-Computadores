section .data
    msg db 'Resultado: ', 0
    newline db 0xA

section .bss
    res resb 4        ; Espacio para el resultado

section .text
    global _start

_start:
    ; Instrucciones aritméticas
    mov eax, 4
    mov ebx, 6
    add eax, ebx      ; cambiamos el valor a 11

    ; Instrucción lógica (OR)
    or eax, 0x0       ; Mantener el valor en eax, solo para mostrar un uso de la instrucción
                      ; EAX sigue siendo 11

    ; Instrucciones de manipulación de bits
    shr eax, 0        ; Desplazamiento a la derecha por 0 (sin cambio)
                      ; EAX sigue siendo 11

    ; Guardar el resultado en la sección .bss
    mov [res], eax    ; Guardar el resultado 11

    ; Llamar a la rutina para imprimir el resultado
    mov eax, 4        ; Syscall para escribir
    mov ebx, 1        ; Usar la salida estándar (pantalla)
    mov ecx, msg      ; Dirección del mensaje a imprimir
    mov edx, 11       ; Longitud del mensaje
    int 0x80          ; Interrupción para imprimir el mensaje

    ; Imprimir el número (resultado almacenado en 'res')
    mov eax, [res]    ; Cargar el resultado en EAX = 11
    add eax, 'a'      ; Convertir 12 a ASCII, EAX = 11 + 97 = 108 ('l' en ASCII)
    mov [res], eax    ; Almacenar el carácter convertido
    mov eax, 4        ; Syscall para escribir
    mov ebx, 1        ; Usar la salida estándar
    mov ecx, res      ; Dirección del resultado
    mov edx, 1        ; Longitud de 1 carácter
    int 0x80          ; Interrupción para imprimir el carácter 'l'

    ; Imprimir nueva línea
    mov eax, 4        ; Syscall para escribir
    mov ebx, 1        ; Usar la salida estándar
    mov ecx, newline  ; Dirección de la nueva línea
    mov edx, 1        ; Longitud de 1 carácter
    int 0x80          ; Interrupción para imprimir nueva línea

    ; Terminar el programa
    mov eax, 1        ; Syscall para salir
    xor ebx, ebx      ; Código de salida 0
    int 0x80          ; Interrupción para terminar el programa
