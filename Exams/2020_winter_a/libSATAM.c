int foo(int* arr, int k)
{
    for (int i = 0; i<k; i++)
        for (int j = 1; j < k-i; j++)
            if (arr[ j-1 ] > arr[ j ])
            {
                int temp = arr[ j-1 ];
                arr[ j-1 ] = arr[ j ];
                arr[ j ] = temp;
            }

    return arr[ k-1 ];
}
