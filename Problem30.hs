import Data.Char

sumOfFifthPowers n = sum $ map ((^5).digitToInt) $ show n

isSpecial n = sumOfFifthPowers n == n

main = print $ sum $ filter isSpecial [2..194979]