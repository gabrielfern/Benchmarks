#!/usr/bin/env node
// tested with node v8.4.0


module.exports = {
    'prime': prime,
    'yieldprime': yieldprime
}


function prime(num) {
    if (num < 2)
        return false
    if (num == 2)
        return true
    if (num%2 == 0)
        return false

    for (let i = 3; i<Math.floor(num/2); i += 2) {
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


if (require.main) {
    if (process.argv.length > 2) {
        console.time('taken time')
        console.log(yieldprime(parseInt(process.argv[2])))
        console.timeEnd('taken time')
    }
    else
        console.log('Needed a positive integer as command line argument')
}
