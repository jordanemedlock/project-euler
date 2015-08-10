module OrdElem where

ordNotElem :: (Ord a, Eq a) => a -> [a] -> Bool
ordNotElem x (y:ys) | x == y    = False
                    | x < y     = True
                    | x > y     = ordNotElem x ys
                    | otherwise = True
ordNotElem _ [] = True


ordElem :: (Ord a, Eq a) => a -> [a] -> Bool
ordElem x (y:ys) | x == y    = True
                 | x < y     = False
                 | x > y     = ordElem x ys
                 | otherwise = False
ordElem _ [] = False