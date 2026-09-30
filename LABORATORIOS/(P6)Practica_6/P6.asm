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

    push ESI

    ; *********************************  inciso e
    mov EAX,10	; cambio de linea
	call putchar

    mov CH, 0xA7
    mov AL, CH

    ;original 1010-0111
    ;cambio   0100-1000
    ;resultado 1110-1111
    ;cambio en hex 0x48

    mov EAX, 0x48
    xor CH, AL
    mov AL, CH
    call pBin_b

    ; *********************************  inciso f
    mov EAX,10	; cambio de linea
	call putchar

    mov BP, 0x67DA
    mov AX, BP                            ; BP ES DE 16 BITS

    ;Original 0110-0111-1101-1010
    ;Cambiar  0E00-0A00-0601-0010
    ;Cambiar en hex 0x4452
    ;Resultado 0010-0011-1000-1000
    
    xor BP, 0x4452
    mov AX, BP
    call pBin_w

    ; *********************************  inciso g
    mov EAX,10	; cambio de linea
	call putchar

    shr BP, 3
    mov AX, BP
    call pBin_w
    
    ;original       0010-0011-1000-1000
    ;nuevo          0000-0100-0111-0001


    ; *********************************  inciso h
    mov EAX,10	; cambio de linea
	call putchar

    mov EBX, 0x4452
    shr EBX, 5
    mov EAX, EBX
    call pBin_dw
    
    ;original       0000-0000-0000-0000-0100-0100-0101-0010
    ;nuevo          0000-0000-0000-0000-0000-0010-0010-0010


    ; *********************************  inciso i
    mov EAX,10	; cambio de linea
	call putchar

    sal CX, 3
    mov AX, CX
    call pBin_dw

    ;antes 1110-1111-0100-0000
    ;despues 0000-0000-0000-0000-0111-1010-0000-0000

    

    ; *********************************  inciso j
    mov EAX,10	; cambio de linea
	call putchar

    POP ESI
    mov EAX, ESI
    call pBin_dw

    ; *********************************  inciso k
    mov EAX,10	; cambio de linea
	call putchar

    mov eax, esi 
    shl eax, 2      
    add eax, esi   
    shl eax, 1      
    mov esi, eax   

    call pBin_dw


    ; *********************************  fin  *********************************
    mov EAX,10	; cambio de linea
	call putchar

    mov eax, 1	;system call number (sys_exit) -- fin del programa
    int 0x80        ;call kernel

section .data