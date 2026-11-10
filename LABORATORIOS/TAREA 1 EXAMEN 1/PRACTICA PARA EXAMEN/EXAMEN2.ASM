;Practica para examen

;Corrimientos SHL Y SHR

section .text

global _start

global correrIzq ; declaras la funcion usando global nombrefun


correrIzq: ; defines la funcion con el nombre y dos punts

    ;Protocolo de entrada
    PUSH EBP ; EBP apunta a la base de la pila, guardas la direccion en el tope
    mov ebp, esp; ESP APUNTA A LA CIMA DE LA PILA Y CON ESTA LINEA EBP APUNTA A LA CIMA DE LA PILA TAMBIEN

    ;Desarrollo
    mov AL, [EBP+8] ; los argumentos de la funcion lo guarda en AL
    SHL AL,1

    ;PROTOCOLO DE SALIDA
    POP ESP
    ret

 global mAnd;

 mAnd: 
    ;
    push ebp  
    PUSH EBX
    mov ebp,esp

    mov EAX, [ebp+8]
    mov EBX, [ebp+12]
    and EAX, EBX

    POP ESP
    POP EBX
    RET

_start:

    PUSH DWORD 16
    PUSH DWORD 13
    call mAnd
    add esp, 8

    PUSH DWORD 5
    call correrIzq
    add esp, 4

    mov eax, 1
    int 0x80

