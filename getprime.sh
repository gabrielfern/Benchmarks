#!/usr/bin/env bash


# return 1 if the number is prime else 0
prime() {
    if [ $1 -lt 2 ]
    then
        return 0
    elif [ $1 -eq 2 ]
    then
        return 1
    elif [ $(($1 % 2)) -eq 0 ]
    then
        return 0
    else
        if [ $(($1/2)) -gt 3 ]
        then
            for i in $(eval echo {3..$(($1/2))..2})
            do
                if [ $(($1 % $i)) -eq 0 ]
                then
                    return 0
                fi
            done
        fi
    fi

    return 1
}


yieldprime() {
    count=1
    primes=2
    while :
    do
        if [ $count -eq $1 ]
        then
            echo $primes
            return
        fi
        let primes++
        if !(prime $primes)
        then
            let count++
        fi
    done
}


if [ $# -ne 1 ]
then
    echo you need to provide a cli argument
else
    time yieldprime $1
fi
