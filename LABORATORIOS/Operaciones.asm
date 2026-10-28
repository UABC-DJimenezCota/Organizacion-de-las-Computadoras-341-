; ==============================================================================
; EJEMPLOS DE OPERACIONES CON REGISTROS (Sintaxis Intel)
; Formato: INSTRUCCIÓN DESTINO, FUENTE
; ==============================================================================

add eax, al      ; Suma el byte AL a los 32 bits de EAX. Guarda el resultado en EAX.
mov ebx, edx     ; Copia el valor de EDX (32 bits) dentro de EBX. EDX no cambia.
sub ecx, 5       ; Resta 5 al valor del registro ECX. Guarda el resultado en ECX.
inc esi          ; Incrementa en 1 el valor del registro ESI.
dec edi          ; Decrementa en 1 el valor del registro EDI.
xor edx, edx     ; Compara EDX consigo mismo. Deja el registro EDX en 0 de forma rápida.
push ebp         ; Guarda el valor de EBP en el tope de la pila (stack).
pop ebp          ; Saca el valor del tope de la pila y lo restaura en EBP.
cmp eax, ebx     ; Compara EAX con EBX restándolos internamente para activar banderas (flags).
jmp mi_etiqueta  ; Salta directamente a la línea marcada como "mi_etiqueta".
je otra_zona     ; Salta a "otra_zona" solo si la comparación anterior dio igual (Zero Flag = 1).
call mi_func     ; Llama a una función (guarda la dirección de retorno en la pila y salta).
ret              ; Regresa de una función (saca la dirección de la pila y salta de vuelta).

mul ebx      ; Multiplica EAX por EBX (sin signo). El resultado de 64 bits se guarda en EDX:EAX.
div ecx      ; Divide el número de 64 bits en EDX:EAX entre ECX (sin signo). Cociente en EAX, resto en EDX.
imul ebx     ; Multiplica EAX por EBX (con signo). El resultado se guarda en EDX:EAX.
idiv ecx     ; Divide EDX:EAX entre ECX (con signo). Cociente en EAX, resto en EDX.

and eax, ebx ; Aplica la operación lógica AND bit a bit entre EAX y EBX. Guarda el resultado en EAX.
or eax, ebx  ; Aplica la operación lógica OR bit a bit entre EAX y EBX. Guarda el resultado en EAX.
not eax      ; Invierte todos los bits de EAX (Operación NOT o Complemento a 1).

shl eax, 2   ; Desplaza los bits de EAX a la izquierda 2 veces (multiplica eficientemente por 4).
shr eax, 2   ; Desplaza los bits de EAX a la derecha 2 veces (divide eficientemente por 4, sin signo).
sar eax, 2   ; Desplaza los bits de EAX a la derecha 2 veces conservando el bit de signo (división con signo).

jne otra_zona; Salta a "otra_zona" si la comparación anterior NO dio igual (Zero Flag = 0).
jg destino   ; Salta si el primer operando era mayor que el segundo (con signo).
jl destino   ; Salta si el primer operando era menor que el segundo (con signo).
ja destino   ; Salta si el primer operando era mayor (en comparaciones sin signo).
jb destino   ; Salta si el primer operando era menor (en comparaciones sin signo).

lea eax, [ebx+4] ; Carga la dirección de memoria efectiva (calcula EBX + 4 y guarda el resultado en EAX).
nop          ; No hace nada (No Operation). Se usa para rellenar espacio o crear pequeños retardos.

