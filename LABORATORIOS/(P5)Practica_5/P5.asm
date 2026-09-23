%include "../../LIB/pc_iox.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

;Ensamblar:	nasm -f elf32 P5.asm -o P5.o
;Enlazar: 	ld -m elf_i386 P5.o -L../../LIB -lpc_iox -o P5
;Ejecutar:	./P5

section .text
    global _start  ;referencia para inicio de programa

_start:

    ; a) Coloque en EBX el valor 0x5C4B2A60.
    mov EBX, 0x5C4B2A60
    ADD EBX, 0X02210041
    mov EAX, EBX
    call pHex_dw

    mov al,10	; cambio de linea
	call putchar

    ; b) Coloque los 16bits menos significativos de EBX en la pila.
    push BX
    mov EAX, ESP
    call pHex_w

    mov al,10	; cambio de linea
	call putchar

    ; c) Defina una variable N de 2 bytes de longitud...

    mov AL, BL
    mov CL, 8
    mul CL
    mov [N], AX
    movzx EAX, word [N] 
    call pHex_w

    mov AL, 10
    call putchar


    ; d) Incrementar en 1el valor guardado en N.

    movzx EAX, word [N]
    call pHex_w

    mov AL, 10
    call putchar

    ; e) Divida el valor almacenado en BX entre 0xFF.

    mov AX, BX
    mov CL, 0xFF
    div CL

    movzx EDX, AH

    push EDX
    movzx EAX, AL
    call pHex_b
    mov AL, 10
    call putchar

    pop EDX
    mov EAX, EDX
    call pHex_b
    mov AL, 10
    call putchar

    ; f) Realice la suma entre el valor almacenado en N y el residuo de la división anterior.
    ; g) Guarde el valor en N y decremente N.

    mov AX, [N]
    add AX, DX
    mov [N], AX

    dec word [N]

    pushfd
    pop EAX
    call pHex_dw

    mov AL, 10
    call putchar

    ; h) Saque un dato de 16 bits de la pila.

    pop AX
    movzx EAX, AX
    call pHex_w

    mov AL, 10
    call putchar

    ; Finalizar programa
    mov EAX, 1
    mov EBX, 0
    int 0x80

    section .data
    N dw 0