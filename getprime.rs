use std::env;


fn prime(num: u32) -> bool {
    let mut resp = true;    
    if num < 2 {
        resp = false;
    } else {
        if num > 2 {
            if num%2 == 0 {
                resp = false;
            } else {
                let mut i = 3;
                while i < num/2 {
                    if num%i == 0 {
                        resp = false;
                        break;
                    }
                    i += 2;
                }
            }
        }
    }
    resp
}


fn yieldprime(target: u32) -> u32 {
    let mut count = 1;
    let mut primes = 2;
    loop {
        if count == target {
            break;
        }
        primes += 1;
        if prime(primes) {
            count += 1;
        }
    }
    primes
}


fn main() {
    let args: Vec<String> = env::args().collect();
    let arg: u32 = args[1].trim().parse().expect("Please type a number!");
    println!("{}", yieldprime(arg));
}
