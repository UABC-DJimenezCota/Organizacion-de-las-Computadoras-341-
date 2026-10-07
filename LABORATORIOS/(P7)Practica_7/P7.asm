%include "../../LIB/pc_io.inc"
%include "../../LIB/pc_iox.inc"

;Ensamblar:	nasm -f elf32 P7.asm -o P7.o
;Enlazar: 	ld -m elf_i386 P7.o -L../../LIB/ -lpc_io -lpc_iox -o P7
;Ejecutar:	./P7

section .data
	; Mensajes inciso a
	msg_a_prompt db "Captura una letra ('a'-'z'): ", 0
	msg_a_menor  db 10, "El caracter es menor a 'm'", 0
	msg_a_mayor  db 10, "El caracter NO es menor a 'm'", 0

	; Mensajes inciso b
	msg_b_prompt db "Captura un caracter [0-9] o [A-Z]: ", 0
	msg_b_num    db 10, "El caracter es un NUMERO", 0
	msg_b_letra  db 10, "El caracter es una LETRA", 0
	msg_b_inv    db 10, "Caracter fuera de rango", 0

	; Mensajes inciso c
	msg_c_title  db "--- Triangulo de Asteriscos ---", 10, 0

	; Mensajes inciso d
	msg_d_prompt db "Captura 10 caracteres:", 10, 0
	msg_d_res    db 10, "Datos capturados:", 10, 0

section .bss
	arreglo resb 10		; Arreglo de 10 bytes para inciso d

section .text

	global _start

_start:

	; *********************************  inciso a
	push msg_a_prompt
	call puts
	add esp, 4

	call getche		; Captura carácter en AL[cite: 1]
	cmp AL, 'm'
	jl .a_menor

	push msg_a_mayor
	call puts
	add esp, 4
	jmp .fin_a

.a_menor:
	push msg_a_menor
	call puts
	add esp, 4

.fin_a:

	; *********************************  inciso b
	mov EAX, 10	; cambio de linea
	call putchar

	push msg_b_prompt
	call puts
	add esp, 4

	call getche		; Captura carácter[cite: 1]

	; Evaluar rango '0'..'9'
	cmp AL, '0'
	jl .b_invalido
	cmp AL, '9'
	jle .b_numero

	; Evaluar rango 'A'..'Z'
	cmp AL, 'A'
	jl .b_invalido
	cmp AL, 'Z'
	jle .b_letra
	jmp .b_invalido

.b_numero:
	push msg_b_num
	call puts
	add esp, 4
	jmp .fin_b

.b_letra:
	push msg_b_letra
	call puts
	add esp, 4
	jmp .fin_b

.b_invalido:
	push msg_b_inv
	call puts
	add esp, 4

.fin_b:

	; *********************************  inciso c
	mov EAX, 10	; cambio de linea
	call putchar

	push msg_c_title
	call puts
	add esp, 4

	mov CX, 4		; CX define el tamano del triangulo (0 a 10)[cite: 1]

	cmp CX, 0
	jle .fin_c

	movzx ECX, CX	; Extensión a 32 bits
	mov EBX, 1	; EBX = renglón actual ascendente

	; Parte ascendente (1 a CX)
.loop_asc:
	push ECX
	push EBX

	mov EDI, EBX
.loop_ast1:
	push dword '*'
	call putchar
	add esp, 4
	dec EDI
	jnz .loop_ast1

	mov EAX, 10	; cambio de linea
	call putchar

	pop EBX
	pop ECX

	cmp EBX, ECX
	je .preparar_desc
	inc EBX
	jmp .loop_asc

.preparar_desc:
	dec EBX		; Comienza en CX - 1

	; Parte descendente (CX - 1 a 1)
.loop_desc:
	cmp EBX, 0
	jle .fin_c

	push EBX

	mov EDI, EBX
.loop_ast2:
	push dword '*'
	call putchar
	add esp, 4
	dec EDI
	jnz .loop_ast2

	mov EAX, 10	; cambio de linea
	call putchar

	pop EBX
	dec EBX
	jmp .loop_desc

.fin_c:

	; *********************************  inciso d
	mov EAX, 10	; cambio de linea
	call putchar

	push msg_d_prompt
	call puts
	add esp, 4

	; Capturar 10 caracteres
	mov ECX, 10
	mov ESI, 0

.loop_cap:
	push ECX
	push ESI
	call getche
	pop ESI
	pop ECX

	mov [arreglo + ESI], AL
	inc ESI
	loop .loop_cap

	; Imprimir mensaje
	push msg_d_res
	call puts
	add esp, 4

	; Presentar en columna (uno por renglon)[cite: 1]
	mov ECX, 10
	mov ESI, 0

.loop_imp:
	push ECX
	push ESI

	movzx EAX, byte [arreglo + ESI]
	push EAX
	call putchar
	add esp, 4

	mov EAX, 10	; cambio de linea
	call putchar

	pop ESI
	pop ECX

	inc ESI
	loop .loop_imp

	; *********************************  fin  *********************************
	mov EAX, 10	; cambio de linea
	call putchar

	mov eax, 1	; system call number (sys_exit) -- fin del programa
	int 0x80	; call kernel