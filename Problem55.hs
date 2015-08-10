reverseNum :: Integer -> Integer
reverseNum = read.reverse.show 

transform x = x + reverseNum x

isPalandromic x = x == reverseNum x

isLychrel = all (not.isPalandromic) . take 50 . tail . iterate transform 

main = print $ length $ filter isLychrel [1..10000]