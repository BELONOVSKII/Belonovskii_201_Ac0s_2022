#include <stdio.h>
#include <stdlib.h>

void printMatrix( int** matrix, int N, int M )
{
    int i, j;
    for(i = 0; i < M; i++)
    {
         for (j = 0; j < N; j++)
         {
             printf("%d ", matrix[i][j]);
         }
     printf("\n");
    }
}
void transpose(int** matrix, int N, int M)
{
    int matrix2[M][N];

    for (int i = 0; i < M; i++)
    {
        for (int j = 0; j < N; j++)
        {
            matrix2[i][j] = matrix[j][i];
        }
    }

    for (int i = 0; i < M; i++)
    {
        for (int j = 0; j < N; j++)
        {
            matrix[i][j] = matrix2[i][j];
        }
    }
}
int main()
{
    int N,M, i, j; 
    printf("Enter the row number: ");
    scanf("%d",&N);    
    printf("Enter the column number: ");
    scanf("%d",&M);

    int** matrix = malloc(sizeof(int)*N*M);
    for (i = 0; i < M; i++)
    {
        int* row = malloc(sizeof(int)*N);
        for(int j = 0; j < N; j++)
        {
            printf("%d row, %d column: ", i+1, j+1);
            scanf("%d", &row[j]);
        }
        matrix[i] = row;
    }

    printf("Initial matrix: \n");
    printMatrix(matrix, N, M);

    transpose(matrix, N, M);

    printf("Transposed matrix: \n");
    printMatrix(matrix, N, M);

    free(matrix);
    return 0;
}
