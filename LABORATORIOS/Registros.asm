;Ensamblar: nasm -f elf32 P8.asm -o P8.o
;Enlazar: ld -m elf_i386 P8.o -L../../LIB/ -lpc_iox -o P8
;Ejecutar: ./P8

; ==============================================================================
; DIVISIONES DEL REGISTRO DE ACUMULADOR (Desde 64 bits hasta 8 bits)
; Modificar el tamaño más pequeño altera automáticamente las partes más grandes.
; ==============================================================================

RAX ; 64 bits, Registro de acumulador completo (8 bytes). Volátil. Usado para el valor de retorno en funciones de 64 bits.
EAX ; 32 bits, Mitad inferior de RAX (4 bytes). Volátil. Equivale al acumulador completo en sistemas de 32 bits.
AX  ; 16 bits, Mitad inferior de EAX (2 bytes). Volátil. Registro de acumulador clásico (herencia de sistemas de 16 bits).
AH  ; 8 bits, Byte superior de AX (1 byte). Volátil. Permite manipular directamente la parte alta de los 16 bits originales.
AL  ; 8 bits, Byte inferior de AX (1 byte). Volátil. Usado para operaciones aritméticas pequeñas o caracteres individuales.

; ==============================================================================
; DIVISIONES DEL REGISTRO BASE
; ==============================================================================

RBX ; 64 bits, Registro base completo (8 bytes). Preservado.
EBX ; 32 bits, Mitad inferior de RBX (4 bytes). Preservado. Registro base en sistemas de 32 bits.
BX  ; 16 bits, Mitad inferior de EBX (2 bytes). Preservado.
BH  ; 8 bits, Byte superior de BX (1 byte). Preservado.
BL  ; 8 bits, Byte inferior de BX (1 byte). Preservado.

; ==============================================================================
; DIVISIONES DEL REGISTRO CONTADOR
; ==============================================================================

RCX ; 64 bits, Registro contador completo (8 bytes). Volátil.
ECX ; 32 bits, Mitad inferior de RCX (4 bytes). Volátil. Registro contador en sistemas de 32 bits.
CX  ; 16 bits, Mitad inferior de ECX (2 bytes). Volátil.
CH  ; 8 bits, Byte superior de CX (1 byte). Volátil.
CL  ; 8 bits, Byte inferior de CX (1 byte). Volátil. Usado como contador en desplazamientos de bits (shift/rotate).

; ==============================================================================
; DIVISIONES DEL REGISTRO DE DATOS
; ==============================================================================

RDX ; 64 bits, Registro de datos completo (8 bytes). Volátil.
EDX ; 32 bits, Mitad inferior de RDX (4 bytes). Volátil. Registro de datos en sistemas de 32 bits.
DX  ; 16 bits, Mitad inferior de EDX (2 bytes). Volátil.
DH  ; 8 bits, Byte superior de DX (1 byte). Volátil.
DL  ; 8 bits, Byte inferior de DX (1 byte). Volátil.

; ==============================================================================
; DIVISIONES DE LOS REGISTROS DE ÍNDICE Y PUNTEROS
; Nota: En 64 bits introdujeron accesos de 8 bits para estos registros (con sufijo "B").
; ==============================================================================

RSI ; 64 bits, Índice fuente completo (8 bytes). Volátil en 64 bits.
ESI ; 32 bits, Mitad inferior de RSI (4 bytes). Preservado en 32 bits.
SI  ; 16 bits, Mitad inferior de ESI (2 bytes). Preservado.
SIL ; 8 bits, Byte inferior de SI (1 byte). Volátil/Preservado según contexto. Exclusivo de 64 bits.

RDI ; 64 bits, Índice destino completo (8 bytes). Volátil en 64 bits.
EDI ; 32 bits, Mitad inferior de RDI (4 bytes). Preservado in 32 bits.
DI  ; 16 bits, Mitad inferior de EDI (2 bytes). Preservado.
DIL ; 8 bits, Byte inferior de DI (1 byte). Volátil/Preservado según contexto. Exclusivo de 64 bits.

RBP ; 64 bits, Puntero de base completo (8 bytes). Preservado.
EBP ; 32 bits, Mitad inferior de RBP (4 bytes). Preservado.
BP  ; 16 bits, Mitad inferior de EBP (2 bytes). Preservado.
BPL ; 8 bits, Byte inferior de BP (1 byte). Preservado. Exclusivo de 64 bits.

RSP ; 64 bits, Puntero de pila completo (8 bytes). Preservado.
ESP ; 32 bits, Mitad inferior de RSP (4 bytes). Preservado.
SP  ; 16 bits, Mitad inferior de ESP (2 bytes). Preservado.
SPL ; 8 bits, Byte inferior de SP (1 byte). Preservado. Exclusivo de 64 bits.

; ==============================================================================
; REGISTROS EXCLUSIVOS DE 64 BITS (R8 a R15) y sus respectivas subdivisiones
; ==============================================================================

R8  ; 64 bits, Registro R8 completo (8 bytes). Volátil. Usado como quinto argumento de funciones.
R8D ; 32 bits, Mitad inferior de R8 (4 bytes). Volátil.
R8W ; 16 bits, Mitad inferior de R8D (2 bytes). Volátil.
R8B ; 8 bits, Byte inferior de R8W (1 byte). Volátil.

R9  ; 64 bits, Registro R9 completo (8 bytes). Volátil. Usado como sexto argumento de funciones.
R9D ; 32 bits, Mitad inferior de R9 (4 bytes). Volátil.
R9W ; 16 bits, Mitad inferior de R9D (2 bytes). Volátil.
R9B ; 8 bits, Byte inferior de R9W (1 byte). Volátil.

R10 ; 64 bits, Registro R10 completo (8 bytes). Volátil. Usado temporalmente por funciones.
R10D; 32 bits, Mitad inferior de R10 (4 bytes). Volátil.
R10W; 16 bits, Mitad inferior de R10D (2 bytes). Volátil.
R10B; 8 bits, Byte inferior de R10W (1 byte). Volátil.

R11 ; 64 bits, Registro R11 completo (8 bytes). Volátil. Usado temporalmente por funciones.
R11D; 32 bits, Mitad inferior de R11 (4 bytes). Volátil.
R11W; 16 bits, Mitad inferior de R11D (2 bytes). Volátil.
R11B; 8 bits, Byte inferior de R11W (1 byte). Volátil.

R12 ; 64 bits, Registro R12 completo (8 bytes). Preservado.
R12D; 32 bits, Mitad inferior de R12 (4 bytes). Preservado.
R12W; 16 bits, Mitad inferior de R12D (2 bytes). Preservado.
R12B; 8 bits, Byte inferior de R12W (1 byte). Preservado.

R13 ; 64 bits, Registro R13 completo (8 bytes). Preservado.
R13D; 32 bits, Mitad inferior de R13 (4 bytes). Preservado.
R13W; 16 bits, Mitad inferior de R13D (2 bytes). Preservado.
R13B; 8 bits, Byte inferior de R13W (1 byte). Preservado.

R14 ; 64 bits, Registro R14 completo (8 bytes). Preservado.
R14D; 32 bits, Mitad inferior de R14 (4 bytes). Preservado.
R14W; 16 bits, Mitad inferior de R14D (2 bytes). Preservado.
R14B; 8 bits, Byte inferior de R14W (1 byte). Preservado.

R15 ; 64 bits, Registro R15 completo (8 bytes). Preservado.
R15D; 32 bits, Mitad inferior de R15 (4 bytes). Preservado.
R15W; 16 bits, Mitad inferior de R15D (2 bytes). Preservado.
R15B; 8 bits, Byte inferior de R15W (1 byte). Preservado.
