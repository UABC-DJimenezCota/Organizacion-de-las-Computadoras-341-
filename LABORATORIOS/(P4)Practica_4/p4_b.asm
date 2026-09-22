%include "../../LIB/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

;Ensamblar:	nasm -f elf32 p4pt2.asm -o p4pt2.o
;Enlazar: 	ld -m elf_i386 p4pt2.o -L../../LIB -lpc_io -o p4pt2
;Ejecutar:	./p4pt2



section .text
    global _start  ;referencia para inicio de programa

_start:

    ; b) Reemplazar la letra x por X
    ; Direccionamiento indirecto
    mov esi, msg
    add esi, 23
    mov byte [esi], 'X'

              
	mov edx, msg		; edx = dirección de la cadena msg
	call puts			; imprime cadena msg terminada en valor nulo (0)

    ; Finalizar programa
    mov eax, 1
    int 0x80


section .data
msg db 'abcdefghijklmnopqrstuvwxyz0123456789', 0xa, 0