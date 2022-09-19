#include <time.h>
#include <stdlib.h>

#define NUMBER_OF_OPTIONS 4

void get_answers(char answers[], int n)
{
    srand(time(NULL));

    char options[] = {'A', 'B', 'C', 'D'};

    for(int i = 0; i < n; i++)
    {
        answers[i] = options[rand() % NUMBER_OF_OPTIONS];
    }
}
