#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int prime(int num) {
    if(num < 2) 
        return 0;
    if(num == 2)
        return 1;
    if(num%2 == 0)
        return 0;

    for(int i = 3; i<(num/2); i += 2) {
        if(num%i == 0)
            return 0;
    }
    return 1;
}

int yieldprime(int target) {
    int count = 1;
    int primes = 2;
    while(1) {
        if(count == target)
            return primes;
        primes += 1;
        if(prime(primes))
            count++;
    }
}

int main(int argc, char *argv[]) {
    clock_t start = clock();
    int result = yieldprime(atoi(argv[1]));
    clock_t stop = clock();
    double elapsed = (double)(stop - start) / 1000000;
    
    printf("%d\n", result);
    printf("Time Taked: %f secs\n", elapsed);

    return 0;
}
