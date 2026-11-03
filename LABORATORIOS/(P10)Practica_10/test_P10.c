#include <stdio.h>

void pBin8b (int);
void pBin8b (int);
void pBin8b (int);
void pBin8b (int);
void my_putchar (char []);

int main () {
    int arg8b;
    int arg16b;
    int arg32b;
    int arg64b;
    int temp;
    
    do {
        printf("Ingrese un numero menor a 256 ");
        scanf("%d",arg8b);
    }while (0<arg8b<256);

    temp=arg8b;
    printf("El numero %d en binario es",temp);
    pBin8b(arg8b);
    

    do {
        printf("Ingrese un numero menor a 65,535 ");
        scanf("%d",arg16b);
    }while (0<arg16b<65535); 

    temp=arg16b;
    printf("El numero %d en binario es",temp);

    pBin16b(arg16b);
    
    do {
        printf("Ingrese un numero menor a 4,294,967,295 ");
        scanf("%d",arg32b);
    }while (0<arg32b<4294967295); 
    temp=arg32b;
    printf("El numero %d en binario es",temp);

    pBin32b(arg32b);

    do {
        printf("Ingrese un numero menor a  18,446,744,073,709,551,615 ");
        scanf("%d",argarg64b);
    }while (0<arg64b< 18446744073709551615);  
    temp=arg64b;
    printf("El numero %d en binario es",temp);

    pBin64b(arg64b);

    return 0;
}

