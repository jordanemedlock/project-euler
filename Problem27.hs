import Prelude 
import Data.List
import Data.Ord

quadratic :: Num a => (a,a) -> a -> a
quadratic (a,b) n = n*n + a*n + b

allTuples :: [(Int,Int)]
allTuples = [(a,b) | a <- full, b <- full]
  where halfPrimes = takeWhile (<1000) primes
        smallPrimes = map negate halfPrimes
        full = smallPrimes ++ halfPrimes

primes :: [Int]
primes = 2 : filter (null . tail . primeFactors) [3,5..]

primeFactors :: Int -> [Int]
primeFactors n = factor n primes
  where
    factor n (p:ps) 
        | p*p > n        = [n]
        | n `mod` p == 0 = p : factor (n `div` p) (p:ps)
        | otherwise      =     factor n ps
 
ordElem :: (Ord a, Eq a, Show a) => a -> [a] -> Bool
ordElem x (y:ys) | x == y    = True
                 | x < y     = False
                 | x > y     = ordElem x ys
                 | otherwise = False
ordElem _ [] = False

numPrimes xs = length $ takeWhile (`ordElem` primes) xs

testTuple t = numPrimes $ map (quadratic t) [0..1000]

main = do
  let xs = maximumBy (comparing fst) $ zip (map testTuple allTuples) (map (uncurry (*)) allTuples)
  print xs
