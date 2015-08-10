import Data.List
import Control.Monad

start = 1 :: Int

triangular n = n*(n+1) `div` 2
triangulars = map triangular [start..]

factorsOf n = 2 * (length $ filter ((==0).mod n) [1..ceiling $ sqrt $ fromIntegral n])

printMax x ((y,z):ys) = if y > x 
  then do
    print (y,z)
    printMax y ys 
  else printMax x ys


main = print problem_12
-- main = printMax 0 $ zip (map factorsOf triangulars) [start..] 

problem_12 = head $ filter ((> 500) . nDivisors) triangleNumbers
  where nDivisors n = product $ map ((+1) . length) (group (primeFactors n))    
        triangleNumbers = scanl1 (+) [1..]

primes = 2 : filter (null . tail . primeFactors) [3,5..]

primeFactors n = factor n primes
  where
    factor n (p:ps) 
        | p*p > n        = [n]
        | n `mod` p == 0 = p : factor (n `div` p) (p:ps)
        | otherwise      =     factor n ps

