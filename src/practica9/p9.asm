%include "../../lib/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global maximo
    global minimo
    global sumatoria

%macro FOR 4
    push ecx
    push edx
    mov ecx,%1
    mov edx,%2
    .%4:
        call %3
    loop .%4
    pop edx
    pop ecx
%endmacro

funmax:
    cmp eax, [edx]
    jg .salir
    mov eax, [edx]

.salir:
    add edx, 4
    ret

maximo:
    push ebp
    mov ebp, esp
    mov edx, [ebp + 8] ; guarda direccion
    mov ecx, [ebp + 12] ; guarda cantidad de elementos
    mov eax, [edx]
    dec ecx
    add edx, 4
    FOR ecx, edx, funmax, ciclo
.salir:
    pop ebp
    ret

minimo:
    push ebp
    mov ebp, esp
    mov edx, [ebp+8]
    mov ecx, [ebp+12]
    mov eax, [edx]
    dec ecx
    add edx, 4

.ciclo:
    cmp ecx, 0
    je .salir
    cmp eax, [edx]
    jl .sig
    mov eax, [edx]

.sig:
    add edx, 4
    dec ecx
    jmp .ciclo

.salir:
    pop ebp
    ret

sumatoria:
    push ebp
    mov ebp, esp
    mov edx, [ebp + 8] ; guarda direccion
    mov ecx, [ebp + 12] ; guarda cantidad de elementos
    mov eax, 0

.ciclo:
    cmp ecx, 0
    je .salir
    add eax, [edx]
    add edx, 4
    dec ecx
    jmp .ciclo


.salir:
    pop ebp
    ret



    
section	.data