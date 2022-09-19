#! /bin/bash

gcc -shared -fPIC libSATAM.c -o libSATAM.so
sudo cp libSATAM.so /usr/lib/
gcc -no-pie -nostdlib surprise.c -lSATAM -o surprise.out -Wl,-zlazy
