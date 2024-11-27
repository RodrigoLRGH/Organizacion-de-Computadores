section .data
direccion:
calle db 'Calle Principal', 0 ; Calle
numero db '123', 0 ; Número de casa
colonia db 'Colonia Ejemplo', 0 ; Colonia
section .text
; Ejemplo de acceso a la dirección completa
mov si, direccion ; `si` apunta a la cadena de calle
; Manipular otros elementos de direccion sumando los offsets