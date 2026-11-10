#include<stdio.h>

int str_len(char *);
void str_mid(char *,char *, int, int);
int clrBit(int,int);

int main () {
    int opc;
    int res;
    char arg[20];

    arg = "Este es un string de prueba";

    do{
        printf("1 para usar str_len, 2 para usar str_mid, 3 para usar clrBit... elige");
        scanf("%d",&opc);
        switch(opc){
            case 1:
                res = str_len(arg);
                printf("El tamaño del string es : %d",res);
            break;

            case 2:
            break;
            
            case 3:
            break;   
            
            default:

            break;
        }
    }while(1==1);

}