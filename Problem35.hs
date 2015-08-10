import Data.List
import Primes

primesUnderAMillion = takeWhile (<1000000) primes
rotateNum :: (Num a, Show a, Read a) => a -> a
rotateNum x = read $ tail str ++ [head str] 
  where str = show x

rotateAll = map rotateNum 

rotateThenFilter = filter isPrime . rotateAll

rtf = rotateThenFilter
rotateAllTimes = rtf . rtf . rtf . rtf . rtf . rtf

main = print $ length $ nub $ rotateAllTimes primesUnderAMillion
