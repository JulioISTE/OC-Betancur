#include <stdio.h>

extern int maximo(int *arr, int len);
extern int sumatoria(int *arr, int len);
extern int minimo(int *arr, int len);

int main() {
    int arr[5];

    printf("Captura 5 numeros enteros:\n");

    for (int i = 0; i < 5; i++) {
        printf("Numero %d: ", i + 1);
        scanf("%d", &arr[i]);
    }

    printf("\nElementos capturados:\n");
    for (int i = 0; i < 5; i++) {
        printf("%d ", arr[i]);
    }

    printf("\n\nMaximo: %d\n", maximo(arr, 5));
    printf("\n\nSumatoria: %d\n", sumatoria(arr, 5));
    printf("\n\nMinimo: %d\n", minimo(arr, 5));

    return 0;
}