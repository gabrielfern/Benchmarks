#!/usr/bin/env python

from sys import argv
from time import time


def prime(num):
    if num < 2:
        return False
    if num == 2:
        return True
    if num % 2 == 0:
        return False

    for i in range(3, num//2, 2):
        if num % i == 0:
            return False

    return True


def yieldprime(target):
    count = 1
    primes = 2
    while True:
        if count == target:
            return primes
        primes += 1
        if prime(primes):
            count += 1


if __name__ == '__main__':
    if len(argv) > 1:
        print(yieldprime(int(argv[1])))
