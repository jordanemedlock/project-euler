import OrdElem


primes :: [Integer]
primes = 2 : filter (null . tail . primeFactors) [3,5..]

primeFactors :: Integer -> [Integer]
primeFactors n = factor n primes
  where
    factor n (p:ps) 
        | p*p > n        = [n]
        | n `mod` p == 0 = p : factor (n `div` p) (p:ps)
        | otherwise      =     factor n ps

primeSums = scanl (+) 0

main = print $ last $ filter (`ordElem`primes) $ takeWhile (<1000000) $ primeSums $ drop 3 primes