section .text

global str_len
global str_mid
global clrBit

str_len:
    push ebp ; protocolo de entrada
    mov ebp,esp ; protocolo de entrada

    mov edx, [ebp+8]
    
    mov eax, 0
    .rep: cmp byte[edx], 0
    je .sig
    inc eax
    jmp .rep

    .sig: pop ebp
    ret


clrBit:

