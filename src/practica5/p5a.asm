%include "../../lib/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start       ;referencia para inicio de programa
	
_start:                   
	mov byte [msg], 'Z' ; imprime cadena msg terminada en valor nulo (0)
	mov edx, msg		; edx = dirección de la cadena msg
	call puts			;
	push edx
	push 3
	call mover2
	pop edx
	call puts
	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa


mover2:
	push ebp;
	mov ebp, esp
	mov eax, [ebp + 8]
	mov edx, [ebp + 12]
	mov byte [eax+edx], 'X'
	pop ebp
	ret 4
section	.data
    msg	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0 


