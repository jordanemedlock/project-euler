import OrdElem
import Data.List

p n = n*(3*n - 1) `div` 2

pentagonals = map p [1..]

isPentagonal = (`ordElem` pentagonals) 

isSpecial (x,y) = isPentagonal (abs $ x - y) && isPentagonal (x + y)

interleave xs ys = concatMap (\(x,y) -> [x,y]) $ zip xs ys

(+/+) = interleave

fst4 (x,_,_,_) = x

start = 1
end = 100000

main = do
  print $ isSpecial (10,11)
  print [(x, y) | x <- map p [start..end], y <- map p [start..end], isSpecial(x,y)]