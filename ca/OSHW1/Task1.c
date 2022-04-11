#include <stdio.h>
#include <stdlib.h>
void swap(int* x, int* y)
{
    *x = *x ^ *y;
    *y = *x ^ *y;
    *x = *x ^ *y;
}


int main()
{
    int* x = malloc(sizeof(int));
    int* y = malloc(sizeof(int));

    void (* sw)(int*, int*) = &swap;
    scanf("%d %d", x, y);

   (* sw)(x, y);

    printf("x = %d, y = %d", *x, *y);
    free(y);
    free(x);
    return 0;
}
