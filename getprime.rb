def prime(num)
    if num < 2
        return false
    end
    if num == 2
        return true
    end
    if num%2 == 0
        return false
    end
    for i in (3..(num/2)).step(2)
        if num%i == 0
            return false
        end
    end
    return true
end


def yieldprime(target)
    count = 1
    primes = 2
    while true
        if count == target
            return primes
        end
        primes += 1
        if prime(primes)
            count += 1
        end
    end
end


start = Time.now
puts(yieldprime(Integer(ARGV[0])))
puts('Taked time: ' + String(Time.now-start))
