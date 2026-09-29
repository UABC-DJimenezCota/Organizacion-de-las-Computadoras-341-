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
    mov EAX,10	; cambio de linea
	call putchar

    mov cx, 0x3F48
    mov ax, cx
    call pHex_w
    call pBin_w
    shl cx, 3
    mov ax, cx
    call pHex_w
    call pBin_w

    ; *********************************  inciso c
    mov EAX,10	; cambio de linea
	call putchar

    mov ESI, 0x20D685F3
    ;original  0010-0000-1101-0110-1000-0101-1111-0011
    ;remplazar 0100-0000-0000-0100-0010-0000-0010-0001
    ;           30             18    13        5     0
    ;remplazar en hex 40042021
    ;resultado 0110-0000-1101-0010-1010-0101-1101-0010
    mov EAX, 0x40042021
    xor ESI, EAX
    call pBin_dw

    ; *********************************  inciso d
    mov EAX,10	; cambio de linea
	call putchar

    push CH , 0xA7

    ; *********************************  inciso e

    mov 

    mov eax, 1	;system call number (sys_exit) -- fin del programa
    int 0x80        ;call kernel

section .data