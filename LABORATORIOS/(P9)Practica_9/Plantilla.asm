;Añadi notas ede repaso

;nasm -f elf32 programa.asm -o programa.o
;Enlazar: ld -m elf_i386 P9.o -L../../LIB/ -lpc_iox -o P9
;Ejecutar: ./P9

;Use compiler explorer para guiarme...

section .data   ; Los datos definidos aquí quedan grabados directamente dentro del archivo binario del programa.

section .text   ; Esta zona de la memoria suele ser de solo lectura.
    ;global main

section .bss     ; se utiliza para reservar espacio en la memoria RAM para variables que no tienen un valor inicial

;_start  ; Es el punto de entrada por defecto que busca el enlazador, es el equivalente de main. En este caso no lo ocupamos ya que solo seran funciones