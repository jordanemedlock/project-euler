import Data.List

swap (a,b) = (b,a)



explode :: (Integral a) => a -> [a]
explode = unfoldr (\a -> if a==0 then Nothing else Just . swap $ quotRem a 10)
 
toRadixList :: Int -> Int -> [Int]
toRadixList r = reverse . unfoldr (\x -> if x == 0 then Nothing else Just . swap $ divMod x r)

toBase10 = toRadixList 10
toBase2 = toRadixList 2

isPalandrome xs = reverse xs == xs

bothPalandrome x = isPalandrome (toBase2 x) && isPalandrome (toBase10 x)

main = print $ sum $ filter bothPalandrome [1..1000000]