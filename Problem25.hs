fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

main = print $ head $ dropWhile ((<1000).length.show.snd) $ zip [0..] fibs

