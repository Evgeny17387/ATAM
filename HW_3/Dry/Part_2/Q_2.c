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

// 0x???????????????? - return address to syscall
// 0x0000000000000017 - pop value for rdi
// 0x???????????????? - return address to pop rdi
// 0x0000000000000060 - pop value for rax
// 0x0000000000401d13 - return address to pop rax
// 0x1122334455667788 - ebp
// 0x1122334455667788 - user_password[8..15]
// 0x1122334455667788 - user_password[0..7]
