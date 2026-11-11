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
    inc edx
    jmp .rep

    .sig: sub eax, 1 
    pop ebp
    ret


str_mid:
    push ebp
    mov ebp, esp
    push esi
    push edi

    mov edi, [ebp+8]
    mov esi, [ebp+12]
    mov ecx, [ebp+16]
    mov edx, [ebp+20]

    cmp ecx, edx
    jg .fin_mid

    add esi, ecx
    sub edx, ecx
    inc edx

.rep_mid:
    mov al, [esi]
    mov [edi], al

    inc esi
    inc edi
    dec edx
    jnz .rep_mid

.fin_mid:
    mov byte [edi], 0

    pop edi
    pop esi
    pop ebp
    ret


clrBit:
    push ebp
    mov ebp, esp

    mov eax, 1
    mov ecx, [ebp+12]

    shl eax, cl
    not eax

    and eax, [ebp+8]

    pop ebp
    ret

