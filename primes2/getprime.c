#include "getprime.h"


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
