
#include <stdio.h>

int str_len(char *);
void str_mid(char *, char *, int, int);
int clrBit(int, int);

int main () {
    int opc;
    int res;
    char chararg[100];
    char chararg2[100];
    int intarg;
    int intarg2;

    do{
        printf("\n1 para usar str_len, 2 para usar str_mid, 3 para usar clrBit, 0 para salir... elige: ");
        scanf("%d",&opc);

        switch(opc){
            case 1:
                printf("Ingresa el string: ");
                scanf(" %99[^\n]", chararg);
                res = str_len(chararg);
                printf("El tamaño del string es: %d\n",res);
            break;

            case 2:
                printf("Ingresa el string de chararg: ");
                scanf(" %99[^\n]", chararg);
                printf("Ingresa intarg e intarg2: ");
                scanf("%d %d", &intarg, &intarg2);
                str_mid(chararg2, chararg, intarg, intarg2);
                printf("El substring es: %s\n", chararg2);
            break;

            case 3:
                printf("Ingresa intarg e intarg2: ");
                scanf("%d %d", &intarg, &intarg2);
                res = clrBit(intarg,intarg2);
                printf("El resultado es: %d\n",res);
            break;

            default:
                printf("Opcion incorrecta\n");
            break;
        }
    }while(1==1);

    return 0;
}
