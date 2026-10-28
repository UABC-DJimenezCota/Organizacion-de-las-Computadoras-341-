
#include <stdio.h>                

int suma(int, int);
int mystrcmp(char *, char *);
int mystrlen(char *);
int getBit(int , int );
int setBit(int , int );

int main() {
    printf("Suma: %d\n", suma(5, 3));
    printf("Comparacion: %d\n", mystrcmp("hola", "hola"));
    printf("Longitud: %d\n", mystrlen("hola"));
    printf("Bit: %d\n", getBit(4, 2));
    printf("SetBit: %d\n", setBit(0, 2));

    return 0;
}
