%include "../../LIB/libpc_iox.inc"

;Ensamblar:	nasm -f elf32 P8.asm -o P8.o
;Enlazar: 	ld -m elf_i386 P8.o -L../../LIB/ -lpc_iox -o P8
;Ejecutar:	./P8


section.data
section.css
vector1 resb 10
vector2 resb 10
section.text

global capturar_n
global desplegarHex_ebx
global capturar_vectores
global desplegarHex_vectores

set_n : ;no mayor a 9
    .loop_tryAgain
        call getche
        mov N, AL
        cmp N, 9
        jmp .loop_tryAgain
    ret

capturar_vectores : ; ecx vees
    mov ECX, 0
    .loop_doItAgain:
        call getch
        push AL
        add ECX, 1
        cmp ECX, N
        jmp .loop_doItAgain
    ret


desplegarHex_vectores:
    .loop
    call pHex_b
    ret

suma_vectores:
    ret
producto_vectores:
    ret

_start:
;inciso a : CAPTURAR N EN ECX (10 DE VALOR MAXIMO)
    call capturar_n

;inciso b : DESPLEGAR N BITES DE EBX EN FORMATO HEX 
    

    call desplegarHex_ebx

;inciso c : 	suma	de	dos	vectores

    call suma_vectores

;inciso d

    call producto_vectores

	; *********************************  fin  *********************************
	mov EAX, 10	; cambio de linea
	call putchar

	mov eax, 1	; system call number (sys_exit) -- fin del programa
	int 0x80	; call kernel