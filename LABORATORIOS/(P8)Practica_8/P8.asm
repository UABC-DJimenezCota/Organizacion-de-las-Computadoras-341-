
%include "../../LIB/pc_iox.inc"

;Ensamblar: nasm -f elf32 P8.asm -o P8.o
;Enlazar: ld -m elf_i386 P8.o -L../../LIB/ -lpc_iox -o P8
;Ejecutar: ./P8

section .data
    N db 5

section .bss
    vector1 resb 10
    vector2 resb 10
    producto resd 1

section .text
global _start
global capturar_vectores
global desplegarHex_ebx
global desplegarHex_vectores
global suma_vectores
global producto_vectores

capturar_vectores:
    .repetir:
        push ecx
        call getche
        pop ecx
        sub al, '0'
        mov [ebx], al
        inc ebx
        loop .repetir
    ret

desplegarHex_ebx:
    jmp desplegarHex_vectores

desplegarHex_vectores:
    .repetir:
        mov al, [ebx]
        push ebx
        push ecx
        call pHex_b
        mov eax, ' '
        call putchar
        pop ecx
        pop ebx
        inc ebx
        loop .repetir
    ret

suma_vectores:
    .repetir:
        mov al, [ebx]
        add al, [edx]
        mov [ebx], al
        inc ebx
        inc edx
        loop .repetir
    ret

producto_vectores:
    push esi
    push edi
    push ebp

    mov esi, ebx
    mov edi, edx
    xor ebp, ebp

    .repetir:
        movzx eax, byte [esi]
        movzx edx, byte [edi]
        imul eax, edx
        add ebp, eax
        inc esi
        inc edi
        loop .repetir

    mov [producto], ebp

    pop ebp
    pop edi
    pop esi
    ret

_start:
    ;inciso a: capturar los vectores
    mov ebx, vector1
    movzx ecx, byte [N]
    call capturar_vectores

    mov eax, 10
    call putchar

    mov ebx, vector2
    movzx ecx, byte [N]
    call capturar_vectores

    mov eax, 10
    call putchar

    ;inciso b: desplegar en hexadecimal
    mov ebx, vector1
    movzx ecx, byte [N]
    call desplegarHex_vectores

    mov eax, 10
    call putchar

    ;inciso c: sumar los vectores
    mov ebx, vector1
    mov edx, vector2
    movzx ecx, byte [N]
    call suma_vectores

    mov ebx, vector1
    movzx ecx, byte [N]
    call desplegarHex_vectores

    mov eax, 10
    call putchar

    ;inciso d: producto escalar
    mov ebx, vector1
    mov edx, vector2
    movzx ecx, byte [N]
    call producto_vectores

    mov eax, [producto]
    call pHex_dw

    mov eax, 10
    call putchar

    mov eax, 1
    xor ebx, ebx
    int 0x80
