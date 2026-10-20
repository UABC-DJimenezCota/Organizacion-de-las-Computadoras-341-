%include "../../LIB/pc_iox.inc"

;Ensamblar:	nasm -f elf32 P8test.asm -o P8test.o
;Enlazar: 	ld -m elf_i386 P8test.o -L../../LIB/ -lpc_iox -o P8
;Ejecutar:	./P8test


section .data
    vector1 db 1,2,3,4,5,6,7,8,9,10
    N db 0

section .bss

    vector2 resb 10
    vector resb 10

section .text

    global capturar_n
    global desplegarHex_vectores

set_n: ;no mayor a 9
    .loop_tryAgain:
        call getche
        sub AL, "0"
        mov N, AL
        loop .loop_tryAgain
        ret
    ret

desplegarHex_vectores:
    mov ECX, 0
    .loop_desplegarHex_vectores:
        mov AL, [vector1+ECX]
        call pHex_b
        add ECX, 1
        cmp ECX, N
        ret
    ret
    
_start:

;inciso b : DESPLEGAR N BITES DE EBX EN FORMATO HEX 
    

    call desplegarHex_vectores


	; *********************************  fin  *********************************
	mov EAX, 10	; cambio de linea
	call putchar

	mov eax, 1	; system call number (sys_exit) -- fin del programa
	int 0x80	; call kernel