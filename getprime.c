#include <stdio.h>
#include <stdlib.h>


int prime(int num)
{
    if(num < 2)
        return 0;
    if(num == 2)
        return 1;
    if(num%2 == 0)
        return 0;

    for(int i = 3; i < (num/2); i += 2) {
        if(num%i == 0)
            return 0;
    }

    return 1;
}


int yieldprime(int target)
{
    int count = 1, primes = 2;
    while(1) {
        if (count == target)
            return primes;
        primes++;
        if (prime(primes))
            count++;
    }
}


int main(int argc, char** argv)
{
    if (argc > 1)
        printf("%d\n", yieldprime(atoi(argv[1])));
}
