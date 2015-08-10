import ClassyPrelude (ordNub)
main = print $ length $ ordNub [a**b | a <- [2..100], b <- [2..100]]