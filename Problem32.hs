import Control.Monad
import Data.List

allSplits :: String -> [(Integer, Integer, Integer)]
allSplits xs = map (fmap' read) [ (take 3 xs, take 2 $ drop 3 xs, drop 5 xs)
               , (take 2 xs, take 3 $ drop 2 xs, drop 5 xs)
               , (take 1 xs, take 4 $ drop 1 xs, drop 5 xs)]

fmap' :: (t -> t1) -> (t, t, t) -> (t1, t1, t1)
fmap' f (a,b,c) = (f a, f b, f c)

pandigitals :: [(Integer, Integer, Integer)]
pandigitals = sort $ concatMap allSplits $ permutations "123456789"

isSpecial (a,b,c) = a * b == c

thrd (_,_,a) = a

main :: IO ()
main = print $ sum $ nub $ map thrd $ filter isSpecial pandigitals
-- $ nub [(a*b,a,b) | a <- pandigitals, b <- pandigitals, c <- pandigitals, a * b == c]

 
combs 0 xs = [([],xs)]
combs n xs = [(y:ys,rest) | y <- xs, (ys,rest) <- combs (n-1) (delete y xs)]
 
l2n :: (Integral a) => [a] -> a
l2n = foldl' (\a b -> 10*a+b) 0
 
swap (a,b) = (b,a)

explode :: (Integral a) => a -> [a]
explode = unfoldr (\a -> if a==0 then Nothing else Just . swap $ quotRem a 10)
 
pandigiticals =
  nub $ do (beg,end) <- combs 5 [1..9]
           n <- [1,2]
           let (a,b) = splitAt n beg
               res = l2n a * l2n b
           guard $ sort (explode res) == end
           return (res, l2n a, l2n b)
 
-- problem_32 = sum pandigiticals