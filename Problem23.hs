{-# LANGUAGE NoImplicitPrelude #-}
import Prelude ()
import ClassyPrelude
-- import Data.List

factorsOf :: Integral a => a -> [a]
factorsOf 1 = [1]
factorsOf 2 = [1]
factorsOf n = ordNub $ 1 : cdr
  where cdr = concatMap (\x -> [x,n`div`x]) filtered
        end = ceiling (sqrt $ fromIntegral n :: Double)
        filtered = filter ((==0).mod n) [2..end]

isAbundant :: Integral a => a -> Bool
isAbundant n = n < sum (factorsOf n)

abundantNumbers :: [Int]
abundantNumbers = filter isAbundant [1..28123]

sumsOfTwo :: [Int]
sumsOfTwo = sort $ ordNub $ concatMap (\x -> map (+x) abundantNumbers') abundantNumbers'
  where abundantNumbers' = abundantNumbers

ordNotElem :: (Ord a, Eq a, Show a) => a -> [a] -> Bool
ordNotElem x (y:ys) | x == y    = False
                    | x < y     = True
                    | x > y     = ordNotElem x ys
                    | otherwise = True
ordNotElem _ [] = trace " " True

main :: IO ()
main = print $ sum $ filter (`ordNotElem`sumsOfTwo) [1..28122]