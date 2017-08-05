#!/usr/bin/python3


import sys

try:
    import _getprime
except ImportError:
    print('Need build extension with python3 setup.py build_ext --inplace')
    sys.exit(1)

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

    prime = _getprime.yieldprime(target)

    print('Taked %.12f seconds to fetch' %(time() - start))
    print(prime)


if __name__=='__main__':
    main()
