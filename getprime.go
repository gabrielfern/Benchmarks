package main

import "os"
import "strconv"


func prime(num int) bool {
    if num < 2 {
        return false
    }
    if num == 2 {
        return true
    }
    if num%2 == 0 {
        return false
    }

    for i := 3; i < num/2; i += 2 {
        if num%i == 0 {
            return false
        }
    }

    return true
}


func yieldprime(target int) int {
    count := 1
    primes := 2
    for {
        if count == target {
            return primes
        }
        primes++
        if prime(primes) {
            count++
        }
    }
}


func main() {
    if len(os.Args) > 1 {
        num, err := strconv.Atoi(os.Args[1])
        if err == nil {
            println(yieldprime(num))
        }
    }
}
