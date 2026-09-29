%include "../../LIB/pc_io.inc"
%include "../../LIB/pc_iox.inc"

extern pBin_n
extern pBin_b
extern pBin_w
extern pBin_dw

;Ensamblar:	nasm -f elf32 P6.asm -o P6.o
;Enlazar: 	ld -m elf_i386 P6.o ../../LIB/pbin.o -L../../LIB/ -lpc_io -lpc_iox -o P6
;Ejecutar:	./P6

section .text

	global _start       ;must be declared for using gcc

_start:  

    ; *********************************  inciso a
    mov EAX, 0x22446688
    call pHex_dw
    ror EAX, 4
    call pHex_dw
    call pBin_dw

    ; *********************************  inciso b
    mov al,10	; cambio de linea
	call putchar

    mov cx, 0x3F48
    call pHex_dw
    shl cx, 3
    call pHex_dw
    call pBin_dw

    ; *********************************  inciso c
    mov al,10	; cambio de linea
	call putchar

    mov eax, 1	;system call number (sys_exit) -- fin del programa
    int 0x80        ;call kernel

section .data