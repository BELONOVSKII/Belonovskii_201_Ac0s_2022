#include <stdio.h>
#include <stdlib.h>

void reverse(int* arr,int N)
{
    int newarr[N];
    int i;
    for (i = 0; i < N; i++)
        newarr[N-i-1] = arr[i];
    for (i = 0; i < N; i++)
        arr[i] = newarr[i];
}

int main()
{
    int N,i;
    printf("Enter the number of values: ");
    scanf("%d",&N);
    int* array = malloc(sizeof(int)*N);

    printf("Fill the array\n");
    for (i = 0; i < N; i++) 
    {
        printf("\n %d -  element: ", i);
        scanf("%d", &array[i]);
    }
    
    reverse(array, N);

    for (i = 0; i < N; i++) 
    {
        printf("\n arr[%d] = %d ", i, array[i]);
    }
    

    free(array);
    return 0;
}
