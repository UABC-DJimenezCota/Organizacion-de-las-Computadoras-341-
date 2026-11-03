;                       nasm -f elf32 P10.asm -o P10.o
section .text

global pBin8b
global pBin16b
global pBin32b
global pBin64b

pBin8b:
    push EBP             ;guarda EBP (el apuntador de la base de la pila) en la pila
    mov EBP, ESP         ;copia ESP (el apuntador sobre la pila) en EBP (ambos apuntan al tope de la pila)
    
    mov EBX, [EBP+32]  
    mov EAX, 8
    push EAX

    global loop8b:
        mov EAX, EBX
        and EAX, 128
        call my_putchar
        pop EAX
        sub EAX, 1
        cmp EAX, 1
        call loop8b

        


    pop EBP              ;restaura EBP a la base
    RET                  ;regresa al programa

pBin16b:
    push EBP             ;guarda EBP (el apuntador de la base de la pila) en la pila
    mov EBP, ESP         ;copia ESP en EBP (ambos apuntan al tope de la pila)

    mov EBX , [EBP+32]  
    and EBX, 128 
    my_putchar

    pop EBP              ;restaura EBP a la base
    RET                  ;regresa al programa

pBin32b:
    push EBP             ;guarda EBP (el apuntador de la base de la pila) en la pila
    mov EBP, ESP         ;copia ESP en EBP (ambos apuntan al tope de la pila)

    

    pop EBP              ;restaura EBP a la base
    RET                  ;regresa al programa

pBin64b:
    push EBP             ;guarda EBP (el apuntador de la base de la pila) en la pila
    mov EBP, ESP         ;copia ESP en EBP (ambos apuntan al tope de la pila)

    

    pop EBP              ;restaura EBP a la base
    RET                  ;regresa al programa

my_putchar: pushad                 ; salvar todos los registros
    push eax              ; salvar EAX -- meter el caracter a la pila
    mov eax,4            ; seleccionar el tipo llamada al sistema --> write (sys_write)

    mov ebx,1            ;  seleccionar la salida a pantalla ---> File descriptor 1 - standard output
    mov ecx,esp        ; ECX debe apuntar a la cadena, en este caso un caracter que está en la pila
    mov edx,1            ; EDX debe tener la longitud de la cadena, en este caso uno solo caracter
    int 80h                 ; llamar al sistema (escritura al standard output -- pantalla)

    pop eax                ; recuperar EXA 
    popad                  ; recuperar todos los registros