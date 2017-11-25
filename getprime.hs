import System.Environment

prime :: Int -> Bool
_prime :: Int -> Int -> Bool
yieldprime :: Int -> Int
_yieldprime :: Int -> Int -> Int -> Int

prime num = _prime num 2

_prime num 2
    | num < 2 = False
    | num == 2 || num == 3 = True
    | mod num 2 == 0 = False
    | otherwise = _prime num 3

_prime num count
    | rest == 0 = False
    | div num 2 < count && rest /= 0 = True
    | otherwise = _prime num (count + 2)
    where rest = mod num count

yieldprime target = _yieldprime target 1 2

_yieldprime target count primes
    | count == target = primes
    | prime (primes + 1) == True = _yieldprime target (count + 1) (primes + 1)
    | otherwise = _yieldprime target count (primes + 1)

main = do
    num <- getArgs >>= readIO.head :: IO Int
    print (yieldprime num)
