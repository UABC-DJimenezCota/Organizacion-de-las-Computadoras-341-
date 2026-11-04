;                       nasm -f elf32 P10.asm -o P10.o

section .text

global pBin8b
global pBin16b
global pBin32b
global pBin64b

; -------- 8 BITS --------
pBin8b:
    push ebp ;protocolo de entrada, empuja ebp a la pila
    mov ebp, esp ; ahora ebp apuntara a el tope de la pila
    push ebx

    movzx ebx, byte [ebp+8]
    shl ebx, 24
    mov ecx, 8
    call print_bits

    pop ebx
    pop ebp
    ret

; -------- 16 BITS --------
pBin16b:
    push ebp ;protocolo de entrada, empuja ebp a la pila
    mov ebp, esp ; ahora ebp apuntara a el tope de la pila
    push ebx

    movzx ebx, word [ebp+8]
    shl ebx, 16
    mov ecx, 16
    call print_bits 

    pop ebx
    pop ebp
    ret

; -------- 32 BITS --------
pBin32b:
    push ebp ;protocolo de entrada, empuja ebp a la pila
    mov ebp, esp ; ahora ebp apuntara a el tope de la pila
    push ebx

    mov ebx, [ebp+8]
    mov ecx, 32
    call print_bits

    pop ebx
    pop ebp
    ret

; -------- 64 BITS --------
pBin64b:
    push ebp ;protocolo de entrada, empuja ebp a la pila
    mov ebp, esp ; ahora ebp apuntara a el tope de la pila
    push ebx

    mov ebx, [ebp+12]
    mov ecx, 32
    call print_bits

    mov ebx, [ebp+8]
    mov ecx, 32
    call print_bits

    pop ebx
    pop ebp
    ret


print_bits:
    shl ebx, 1
    setc al
    add al, '0'
    call my_putchar
    loop print_bits
    ret


my_putchar:
    pushad
    push eax
    mov eax, 4
    mov ebx, 1
    mov ecx, esp
    mov edx, 1
    int 80h
    pop eax
    popad
    ret