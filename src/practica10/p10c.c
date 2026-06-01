#include <stdio.h>
extern int atoi(const char *str);

int main()
{
    char str[100];

    printf("Ingrese un numero entero: ");
    fgets(str, sizeof(str), stdin);

    int num = atoi(str);
    printf("El numero ingresado es: %d\n", num);

    return 0;
}