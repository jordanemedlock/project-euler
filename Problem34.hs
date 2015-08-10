import Data.Char

fact :: (Num a, Enum a) => a -> a
fact x = product [1..x]

toDigits :: Show a => a -> [Int]
toDigits x = map digitToInt $ show x 

isCurious :: Int -> Bool
isCurious x = sum (map fact $ toDigits x) == x

main :: IO () 
main = print $ filter isCurious [3..]