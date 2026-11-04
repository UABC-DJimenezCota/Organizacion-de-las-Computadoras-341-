
#include <stdio.h>
#include <stdint.h>

void pBin8b(uint8_t);
void pBin16b(uint16_t);
void pBin32b(uint32_t);
void pBin64b(uint64_t);

int main() {
    unsigned long long n;

    printf("Ingrese numero de 8 bits: ");
    scanf("%llu", &n);
    pBin8b(n);

    printf("\nIngrese numero de 16 bits: ");
    scanf("%llu", &n);
    pBin16b(n);

    printf("\nIngrese numero de 32 bits: ");
    scanf("%llu", &n);
    pBin32b(n);

    printf("\nIngrese numero de 64 bits: ");
    scanf("%llu", &n);
    pBin64b(n);

     printf("\n");
    return 0;
}
