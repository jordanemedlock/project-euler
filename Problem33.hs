import Control.Applicative
import Control.Arrow
import Data.Ratio
import Data.List

twoDigitNumbers = [10..99]
twoDigitLists = [[x,y] | x <- [1..9], y <- [1..9], x /= y]
fractionsWithTwoDigitsEach = [(num, den) | num <- twoDigitLists
                                         , den <- twoDigitLists ]
lessThanOne = filter (uncurry (<)) fractionsWithTwoDigitsEach

onesThatCancel = filter (\([x,y],z) -> x `elem` z || y `elem` z) lessThanOne

cancelDigits ([x,y], zs) | x `elem` zs = ([y], delete x zs)
                         | y `elem` zs = ([x], delete y zs)
                         | otherwise = ([x,y],zs)
digitsToNumber [x,y] = x * 10 + y
digitsToNumber [x] = x
digitsToNumber _ = error "I am not handling any other cases"

makeRatio (xs,ys) = digitsToNumber xs % digitsToNumber ys 

isSpecial num = makeRatio num == makeRatio (cancelDigits num)

specialNums = product $ map makeRatio $ filter isSpecial onesThatCancel
main = print $ denominator specialNums
