; comente todo el codigo con el proposito de repasarlo

section .text                 ; Declara la sección donde estará el código

global suma                   ; Permite usar las funciones desde C
global mystrcmp               
global mystrlen              
global getBit                 
global setBit                

suma:                   ;declara la seccion "suma" en el codigo
    ; - - - PROTOCOLO DE ENTRADA DE LA FUNCION - - - Aqui no lo necesito
    push EBP             ;guarda EBP (el apuntador de la base de la pila) en la pila
    mov EBP, ESP         ;copia ESP en EBP (ambos apuntan al tope de la pila)
    ; - - - PROTOCOLO DE ENTRADA DE LA FUNCION - - - Aqui no lo necesito solo era para repasarlo

    mov EAX, [EBP+8]     ;pasa el primer parametro a EAX
    ADD EAX, [EBP+12]    ;suma el segundo parametro a EAX

    ; - - - PROTOCOLO DE SALIDA DE LA FUNCION - - - Aqui no lo necesito
    pop EBP              ;restaura EBP a la base
    RET                  ;regresa al programa
    ; - - - PROTOCOLO DE SALIDA DE LA FUNCION - - - Aqui no lo necesito


mystrcmp:                ;compara dos cadenas
    push EBP             ;guarda EBP en la pila
    mov EBP, ESP         ;establece la base de la pila
    push ESI             ;guarda el valor original de ESI
    push EDI             ;guarda el valor original de EDI

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
    mov EAX, 1           ;regresa 1 si son diferentes
    jmp finstrcmp        ;salta al final de la funcion

igual:
    mov EAX, 0           ;regresa 0 si son iguales

finstrcmp:
    pop EDI              ;restaura el valor original de EDI
    pop ESI              ;restaura el valor original de ESI
    pop EBP              ;restaura EBP
    RET                  ;termina la funcion


mystrlen:                 ;cuenta los caracteres de una cadena
    push EBP             ;guarda EBP en la pila
    mov EBP, ESP         ;establece la base de la pila
    push ESI             ;guarda el valor original de ESI

    mov ESI, [EBP+8]     ;obtiene la cadena
    mov EAX, 0           ;inicia el contador en cero

contar:
    cmp byte [ESI], 0    ;revisa si llego al final
    je finstrlen         ;si llego, termina
    inc EAX              ;aumenta el contador
    inc ESI              ;avanza al siguiente caracter
    jmp contar           ;repite

finstrlen:
    pop ESI              ;restaura el valor original de ESI
    pop EBP              ;restaura EBP
    ret                  ;regresa la cantidad de caracteres


getBit:                   ;obtiene el valor de un bit
    push EBP             ;guarda EBP en la pila
    mov EBP, ESP         ;establece la base de la pila

    mov EAX, [EBP+8]     ;obtiene el valor
    mov ECX, [EBP+12]    ;obtiene la posicion del bit
    shr EAX, CL          ;mueve el bit a la primera posicion
    and EAX, 1           ;obtiene el bit

    pop EBP              ;restaura EBP
    ret                  ;regresa el resultado


setBit:                   ;pone un bit en uno
    push EBP             ;guarda EBP en la pila
    mov EBP, ESP         ;establece la base de la pila

    mov EAX, [EBP+8]     ;obtiene el valor
    mov ECX, [EBP+12]    ;obtiene la posicion del bit
    mov EDX, 1           ;guarda un uno
    shl EDX, CL          ;mueve el uno a la posicion indicada
    or EAX, EDX          ;activa el bit

    pop EBP              ;restaura EBP
    ret                  ;regresa el resultado
