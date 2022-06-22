#include <sys/types.h>
#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(int argc, char *argv[])
{
    char* const command = argv[1];
    char* const in = argv[2];
    char* const out = argv[3];

    pid_t pid;
    // fork a child process
    pid = fork();
    if (pid < 0) { // error occurred
        perror("Fork Failed");
        return 1;
    }
    else if (pid == 0)
    {
        int fdOut = open(out, O_CREAT|O_WRONLY|O_TRUNC, S_IRUSR|S_IWUSR);
        int fdIn = open(in, O_RDONLY);
        close(STDOUT_FILENO);
        close(STDIN_FILENO);
        dup2(fdOut, STDOUT_FILENO);
        dup2(fdIn, STDIN_FILENO);
        execlp(command, command, in);
    }
    else
    {
        int wstatus;
        wait(&wstatus);
        printf("%d", WEXITSTATUS(wstatus));
    }
    return 0;
}