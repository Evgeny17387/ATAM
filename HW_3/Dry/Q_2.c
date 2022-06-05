int main()
{
    char user_password[16];

    printf("Enter Password: ");
    scanf("%s", user_password);

    if (check_password(user_password))
        printf("Good! That's the password.\n");
    else
        printf("Sorry, that's not the password.\n");

    return 0;
}