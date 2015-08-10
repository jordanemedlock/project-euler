import Data.Char

numbers = concatMap show [0..]

d n = digitToInt (numbers !! n)

main = print $ (d 1) * (d 10) * (d 100) * (d 1000) * (d 10000) * (d 100000) * (d 1000000)