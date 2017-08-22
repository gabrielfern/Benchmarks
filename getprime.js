#!/usr/bin/env node


function prime(num) {
    if(num < 2)
        return false
    if(num == 2)
        return true
    if(num%2 == 0)
        return false

    for(let i = 3; i<Math.floor(num/2); i += 2) {
        if(num%i == 0)
            return false
    }

    return true
}


function yieldprime(target) {
    var count = 1
    var primes = 2
    while(true) {
        if(count == target)
            return primes
        primes++
        if(prime(primes))
            count++
    }
}


console.time('taken time')
console.log(yieldprime(parseInt(process.argv[2])))
console.timeEnd('taken time')
