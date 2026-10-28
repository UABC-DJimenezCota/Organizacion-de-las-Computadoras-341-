; comente todo el codigo con el proposito de repasarlo

section .text                 ; Declara la sección donde estará el código

global suma                   ; Permite usar suma desde C
global mystrcmp               ; Permite usar mystrcmp desde C
global mystrlen               ; Permite usar mystrlen desde C
global getBit                 ; Permite usar getBit desde C
global setBit                 ; Permite usar setBit desde C

suma:                   ;declara la seccion "suma" en el codigo
    ; - - - PROTOCOLO DE ENTRADA DE LA FUNCION - - - Aqui no lo necesito
    push RBP            ;guarda RBP (el apuntador de la base de la pila) en la pila (la direccion)
    mov RBP, RSP        ;copia RSP en RBP (ahora el apuntador de la base de la pila apunta a el tope superior de la pila, para este punto RBP Y RSP apuntan al tope)
    ; - - - PROTOCOLO DE ENTRADA DE LA FUNCION - - - Aqui no lo necesito solo era para repasarlo

    mov EAX, EDI         ;pasa el primer parametro a EAX
    ADD EAX, ESI         ;suma el segundo parametro a EAX

    ; - - - PROTOCOLO DE SALIDA DE LA FUNCION - - - Aqui no lo necesito
    pop RBP              ;restaura RBP a la base 
    RET                  ;regresa al programa
    ; - - - PROTOCOLO DE SALIDA DE LA FUNCION - - - Aqui no lo necesito


mystrcmp:                ;compara dos cadenas
    mov ESI, [EBP+8]     ;obtiene la primera cadena
    mov EDI, [EBP+12]    ;obtiene la segunda cadena

comparar:
    mov AL, [ESI]        ;obtiene un caracter de la primera cadena
    mov DL, [EDI]        ;obtiene un caracter de la segunda cadena
    cmp AL, DL           ;compara los caracteres
    jne diferente        ;si son diferentes, salta
    cmp AL, 0            ;revisa si llego al final
    je igual             ;si son iguales, salta
    inc ESI              ;avanza en la primera cadena
    inc EDI              ;avanza en la segunda cadena
    jmp comparar         ;repite la comparacion

diferente:
    mov EAX, 1            ;regresa 1 si son diferentes
    ret                   ;termina la funcion

igual:
    mov EAX, 0            ;regresa 0 si son iguales
    ret                   ;termina la funcion


mystrlen:                 ;cuenta los caracteres de una cadena
    mov ESI, [EBP+8]     ;obtiene la cadena
    mov EAX, 0           ;inicia el contador en cero

contar:
    cmp byte [ESI], 0    ;revisa si llego al final
    je finstrlen         ;si llego, termina
    inc EAX              ;aumenta el contador
    inc ESI              ;avanza al siguiente caracter
    jmp contar           ;repite

finstrlen:
    ret                  ;regresa la cantidad de caracteres


getBit:                   ;obtiene el valor de un bit
    mov EAX, [EBP+8]     ;obtiene el valor
    mov ECX, [EBP+12]    ;obtiene la posicion del bit
    shr EAX, CL          ;mueve el bit a la primera posicion
    and EAX, 1           ;obtiene el bit
    ret                  ;regresa el resultado


setBit:                   ;pone un bit en uno
    mov EAX, [EBP+8]     ;obtiene el valor
    mov ECX, [EBP+12]    ;obtiene la posicion del bit
    mov EDX, 1           ;guarda un uno
    shl EDX, CL          ;mueve el uno a la posicion indicada
    or EAX, EDX          ;activa el bit
    ret                  ;regresa el resultado
