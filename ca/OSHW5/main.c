#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <string.h>

static int glob = 0;
static pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;

struct thread_args
{
    int from;
    int to;
    int* array;
};

static void * threadFunc(void *arg)
{
    struct thread_args *args = (struct thread_args*) arg;
    int from = args->from;
    int to = args->to;
    int* array = args->array;

    int total_sum = 0;

    for (int i = from; i < to + 1; i++)
    {
        total_sum += array[i];
    }

    int s = pthread_mutex_lock(&mtx);
    if (s != 0)
    {
        perror("pthread_mutex_lock");
        return NULL;
    }

    glob += total_sum;

    s = pthread_mutex_unlock(&mtx);
    if (s != 0)
    {
        perror("pthread_mutex_unlock");
        return NULL;
    }


}
int main() {
    int N;
    scanf("%d", &N);
    // Generating the array
    int* array = malloc(sizeof(int) * N);

    // filling with random values
    for(int i = 0; i < N; i++)
        array[i]=rand()%100;

    int round = N - (N % 4);
    int part_one = N / 4;
    int part_two = N / 2;
    int part_three = 3 * N / 4;
    int part_four = N;

    pthread_t t1;
    pthread_t t2;
    pthread_t t3;
    pthread_t t4;

    struct thread_args args1;
    struct thread_args args2;
    struct thread_args args3;
    struct thread_args args4;

    args1.from = 0;
    args1.to = part_one - 1;
    args2.from = part_one;
    args2.to = part_two - 1;
    args3.from = part_two;
    args3.to = part_three - 1;
    args4.from = part_three;
    args4.to = N;
    args1.array = array;
    args2.array = array;
    args3.array = array;
    args4.array = array;

    // creating threads
    pthread_create(&t1, NULL, threadFunc, &args1);
    pthread_create(&t2, NULL, threadFunc, &args2);
    pthread_create(&t3, NULL, threadFunc, &args3);
    pthread_create(&t4, NULL, threadFunc, &args4);

    // printing the values of an array
    for(int i = 0; i < N;i++)
    {
        printf("Element number %d: %d\n",i,array[i]);
    }

    // joining threads
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    pthread_join(t3, NULL);
    pthread_join(t4, NULL);

    // printing the sum
    printf("SUM: %d\n", glob);
    free(array);
    return 0;
}
