section .data
email:
correo db 'usuario@example.com', 0 ; Cadena terminada en 0
section .text
; Ejemplo de acceso al correo electrónico
mov si, email ; `si` apunta al inicio de la cadena de correo