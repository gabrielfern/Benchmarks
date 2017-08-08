#!/usr/bin/python


import sys
from ctypes import cdll

from time import time


def main():
    start = time()

    try:
        target = int(sys.argv[1])
        if target <= 0:
            raise ValueError
    except(IndexError, ValueError):
        print('Needed a positive integer as command line argument')
        return
    dll = cdll.LoadLibrary('primes3/getprime.so')

    prime = dll.yieldprime(target)

    print('Taked %.12f seconds to fetch' %(time() - start))
    print(prime)


if __name__=='__main__':
    main()
