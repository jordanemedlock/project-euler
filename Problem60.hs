import OrdElem
import Data.Maybe
import Primes (isPrime)

primes :: [Integer]
primes = 2 : filter isPrime [3,5..]

isSpecialPair x y = isPrime (read $ shows x $ show y) && isPrime (read $ shows y $ show x)

problem60 = do
  let as = take 10000 primes
  a <- as
  let bs = filter (isSpecialPair a) $ dropWhile (<=a) as
  b <- bs
  let cs = filter (isSpecialPair b) $ dropWhile (<=b) bs
  c <- cs 
  let ds = filter (isSpecialPair c) $ dropWhile (<=c) cs
  d <- ds 
  let es = filter (isSpecialPair d) $ dropWhile (<=d) ds
  e <- es 
  return [a,b,c,d,e]


main = print $ map sum problem60