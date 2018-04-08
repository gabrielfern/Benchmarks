#!/usr/bin/env node

exports.prime = prime
exports.yieldprime = yieldprime


function prime(num) {
    if (num < 2)
        return false
    if (num == 2)
        return true
    if (num%2 == 0)
        return false

    for (let i = 3; i < num/2; i += 2) {
        if (num%i == 0)
            return false
    }

    return true
}


function yieldprime(target) {
    let count = 1,
        primes = 2
    while (true) {
        if (count == target)
            return primes
        primes++
        if (prime(primes))
            count++
    }
}


if (!module.parent)
    if (process.argv.length > 2)
        console.log(yieldprime(parseInt(process.argv[2])))
