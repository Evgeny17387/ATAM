
extern int a(int x);

int b(int x)
{
    return a(x);
}

int c(int x)
{
    return b(x);
}
