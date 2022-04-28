#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
    char* regExp = argv[1];
    char* text = argv[2];
    char* replacement = argv[3];

    
    unsigned long textLength = strlen(text);

    unsigned long regExpLength = strlen(regExp);


    char* newText = malloc(sizeof(text));

    char* tempBuffer = malloc(sizeof(text));

    for (unsigned long i = 0; i < textLength;)
    {
        if (text[i] == regExp[0])
        {
            unsigned long j = 1;

            while (j < regExpLength)
            {
                if (text[i+j] != regExp[j])
                {
                    break;
                }
                j++;
            }

            if (j == regExpLength)
            {
                newText = realloc(newText, sizeof(newText) + sizeof(tempBuffer) + sizeof(regExp)+1);
                strcat(newText, tempBuffer);
                strcat(newText, replacement);
                free(tempBuffer);
                tempBuffer = malloc(sizeof(text));
                i += j;
                continue;
            }
        }

        tempBuffer[strlen(tempBuffer)] = text[i];

        i++;
    }

    strcat(newText, tempBuffer);
    printf("%s \n", newText);

    free(newText);
    free(tempBuffer);

    return 0;
}
