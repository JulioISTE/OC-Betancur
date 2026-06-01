%include "../../lib/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start       ;referencia para inicio de programa
	
_start:
	mov edx, cad
	mov ax, [len]
	call Captura
	call puts
	mov edx, nlin
	call putchar
	call Minuscula
	call puts
	mov edx, nlin
	call putchar
	call Mayuscula
	call puts
	mov edx, nlin
	call putchar
	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa

Captura:
	mov cx, ax
	dec cx

.ciclo:
	cmp cx, 0
	je .salir
	call getche
	cmp al, [nlin]
	je .salir
	mov [edx], al
	inc edx
	dec cx
	jmp .ciclo
.salir:
	mov byte[edx], 0
	mov edx, cad
	ret

Minuscula:
	mov edx, cad
.ciclo:
	cmp byte[edx], 0
	je .salir
	cmp byte[edx], 'A'
	jl .sig
	cmp byte[edx], 'Z'
	jg .sig
	add byte[edx], 32
	jmp .sig

.sig:
	inc edx
	jmp .ciclo
.salir:
	mov edx, cad
	ret

Mayuscula:
	mov edx, cad
.ciclo:
	cmp byte[edx], 0
	je .salir
	cmp byte[edx], 'a'
	jl .sig
	cmp byte[edx], 'z'
	jg .sig
	sub byte[edx], 32
	jmp .sig

.sig:
	inc edx
	jmp .ciclo
.salir:
	mov edx, cad
	ret

section	.data
	ncad db 0xa,'Cadena: ',0
    nlin db 0xa
	len db 64
    cad times 64 db 0
