import Data.Char

num 0 = "zero"
num 1 = "one"
num 2 = "two"
num 3 = "three"
num 4 = "four"
num 5 = "five"
num 6 = "six"
num 7 = "seven"
num 8 = "eight"
num 9 = "nine"
num 10 = "ten"
num 11 = "eleven"
num 12 = "twelve"
num 13 = "thirteen"
num 14 = "fourteen"
num 15 = "fifteen"
num x | x `elem` [16..19] = num (x `mod` 10) ++ "teen"
      | x `elem` [20..29] = "twenty" ++ num (x `mod` 10)
      | x `elem` [30..39] = "thirty" ++ num (x `mod` 10)
      | x `elem` [40..49] = "forty" ++ num (x `mod` 10)
      | x `elem` [50..59] = "fifty" ++ num (x `mod` 10)
      | x `elem` [60..69] = "sixty" ++ num (x `mod` 10)
      | x `elem` [70..79] = "seventy" ++ num (x `mod` 10)
      | x `elem` [80..89] = "eighty" ++ num (x `mod` 10)
      | x `elem` [90..99] = "ninety" ++ num (x `mod` 10)
      | x `elem` [100..999] = num (x `div` 100) ++ "hundredand" ++ num (x `mod` 100)
      | x `elem` [1000] = "onethousand"

-- main = print $ sum $ map (length.num) [1..1000]
main = print problem_17

one = ["one","two","three","four","five","six","seven","eight",
     "nine","ten","eleven","twelve","thirteen","fourteen","fifteen",
     "sixteen","seventeen","eighteen", "nineteen"]
ty = ["twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"]
 
decompose x 
    | x == 0                       = []
    | x < 20                       = one !! (x-1)
    | x >= 20 && x < 100           = 
        ty !! (firstDigit x - 2) ++ decompose ( x - firstDigit x * 10)
    | x < 1000 && x `mod` 100 ==0  = 
        one !! (firstDigit x-1) ++ "hundred"
    | x > 100 && x <= 999          = 
        one !! (firstDigit x-1) ++ "hundredand" ++decompose ( x - firstDigit x * 100)
    | x == 1000                    = "onethousand"
 
  where firstDigit x = digitToInt . head . show $ x
 
problem_17 = length . concatMap decompose $ [1..1000]