#include <sys/types.h>
#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>

int main()
{
    pid_t pid;
    // fork a child process
    pid = fork();
    if (pid < 0) { // error occurred
        perror("Fork Failed");
        return 1;
    }
    else if (pid == 0)
    {
        pid_t pid2;
        pid2 = fork();
        if (pid < 0)
        { // error occurred
            perror("Child Fork Failed");
            return 1;
        }
        else if (pid2 == 0)
        {
            printf("Hello from grandchild");
        }
        else
        {
            wait(NULL);
            printf("\nHello from child");
        }
    }
    else
    { // parent process
        // parent will wait for the child to complete
        wait(NULL);
        printf("\nHello from parent\n");
    }
    return 0;
}
