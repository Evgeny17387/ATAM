#include <stdio.h>

#define NUMBER_OF_QUESTIONS 20

void get_answers(char answers[], int n);

int main()
{
    char answers[NUMBER_OF_QUESTIONS] = {0};

    get_answers(answers, NUMBER_OF_QUESTIONS);

    for(int i = 0; i < NUMBER_OF_QUESTIONS; i++)
    {
        printf("The answer for question %d is %c\n", i + 1, answers[i]);
    }

    return 0;
}
