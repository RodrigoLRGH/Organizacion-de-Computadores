section .data
    mensaje db 'Resultado: ', 0
    newline db 10

section .bss
    resultado resb 1

section .text
    global _start

_start:
    ; Cargar valores decimales en registros
    mov ax, 5           ; AX = 5
    mov bx, 3           ; BX = 3

    ; Realizar la operación AND
    and ax, bx          ; AND entre 5 y 3, resultado en AX

    ; Convertir el resultado en carácter imprimible
    add ax, '0'         ; Convierte el número a su valor ASCII

    ; Guardar el resultado en la variable
    mov [resultado], ax

    ; Imprimir el mensaje
    mov eax, 4          ; syscall: write
    mov ebx, 1          ; file descriptor: stdout
    lea ecx, [mensaje]  ; cargar el mensaje
    mov edx, 11         ; longitud del mensaje
    int 0x80            ; Llamar al sistema para imprimir

    ; Imprimir el resultado
    mov eax, 4          ; syscall: write
    mov ebx, 1          ; file descriptor: stdout
    lea ecx, [resultado] ; cargar el resultado
    mov edx, 1          ; longitud del resultado (1 carácter)
    int 0x80            ; Llamar al sistema para imprimir

    ; Imprimir un salto de línea
    mov eax, 4          ; syscall: write
    mov ebx, 1          ; file descriptor: stdout
    lea ecx, [newline]  ; cargar el salto de línea
    mov edx, 1          ; longitud del salto de línea
    int 0x80            ; Llamar al sistema para imprimir

    ; Terminar el programa
    mov eax, 1          ; syscall: exit
    xor ebx, ebx        ; valor de salida 0
    int 0x80            ; Llamar al sistema para terminar
