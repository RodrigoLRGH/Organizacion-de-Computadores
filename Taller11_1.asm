section .data
fecha:
dia db 2 ; dd (2 dígitos)
mes db 2 ; mm (2 dígitos)
ano db 4 ; yyyy (4 dígitos)
section .text
; Ejemplo de acceso a los campos de fecha
mov al, [fecha + dia] ; Acceder al día
mov bl, [fecha + mes] ; Acceder al mes
mov cx, [fecha + ano] ; Acceder al año (16 bits)