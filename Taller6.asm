MOV AX,BX ; AX=BX
MOV DL,CH ; DL=CH
MOV BX,1500 ; BX=1500
MOV AX,[2458H] ; AX=contenido en DS:2458H
MOV [2458H],AL ; contenido en DS:2458H=AL
MOV [BX],AL ; contenido en DS:BX=AL
MOV AL,[BX] ; AL=contenido en DS:BX
MOV DS,AX ; DS=AX

ADD AX,3500
ADD BYTE PTR [SI],35
ADD BX,DX
ADD [BX],AX
ADD AH,[BX]

SUB AX,3500
SUB BYTE PTR [SI],35
SUB BX,DX
SUB [BX],AX
SUB AH,[BX]

INC AX ; AX=AX+1
INC DL ; DL=DL+1
INC WORD PTR ES:[DI+4] ; Increm. palabra contenida

; en ES:DI+4


DEC AX ; AX=AX-1
DEC DL ; DL=DL-1
DEC BYTE PTR ES:[DI+4] ; Decrem. byte contenido en

; ES:DI+4CMP operando_destino,operando_fuente

JMP 100H ; Salta a CX:100h
JMP 55AAH:100H ; Salto lejano a otro segmento
JMP WORD PTR [BX] ; Salto a la dirección contenida en
; la dirección de memoria especificada
; por BX (salto indirecto)
JMP REPITE ; Salto a la etiqueta REPITE

CMP AX, 0
JE etiqueta ; Salta si AX es igual a 0

CMP AX, 0
JNE etiqueta ; Salta si AX no es igual a 0

PUSH AX
POP BX

CALL direc ; Saltar a direc
... ; Dirección de retorno
...
direc ... ; Dirección de salto
...
RET

AND AX,BX
AND SI,ES:[DI]
AND BX,0A34H
AND ES:[BX],CX
AND BYTE PTR [SI+4],5

AND AX,BX
AND SI,ES:[DI]
AND BX,0A34H
AND ES:[BX],CX
AND BYTE PTR [SI+4],5

XOR CX,BX
XOR DI,ES:[SI]
XOR AX,4500H
XOR [BX],AXBX] XOR AX
XOR BYTE PTR [SI+BX],50

NOT DI
NOT BYTE PTR [BX]

SHR AX, 1 ; Desplaza AX a la derecha (AX = AX / 2)
SHL BX, 1 ; Desplaza BX a la izquierda (BX = BX * 2)

