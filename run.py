#!/usr/bin/env python3

from sys import argv
from os import system
from time import time

# bash version will not get here,
# it's so much slower than others
execs = [
    ['python getprime.py'],
    ['node getprime.js'],
    ['ruby getprime.rb'],
    ['./bin/asmprime'],
    ['./bin/cprime'],
    ['./bin/rsprime'],
    ['./bin/goprime'],
    ['./bin/hsprime'],
    ['java -cp bin Prime']
]


def run_all(target, attempts):
    for exec in execs:
        times = []
        for _ in range(attempts):
            start = time()
            system(exec[0] + ' ' + target + ' > /dev/null 2>&1')
            times.append(time() - start)
        exec.append(min(times))


def print_times():
    execs.sort(key = lambda t: t[1])
    for t in execs:
        fmt = '%.6f' % t[1]
        print(fmt.ljust(12), end = '')
        print(t[0])


def main(args):
    run_all(args[1], int(args[2]) if len(args) > 2 else 3)
    print_times()


if __name__ == '__main__':
    main(argv)
