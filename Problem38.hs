import Data.List
import Control.Monad
import ClassyPrelude (trace)

isPandigital :: String -> Bool
isPandigital s = '0' `notElem` s && nub s == s && length s == 9

isSpecial :: Int -> Bool
isSpecial n = any isPandigital (map concat s)
  where x = map (show.(*n)) [1..9] :: [String]
        s = map (`take` x) [2..9]

aand f g x = f x && g x 

main :: IO ()
main = print $ head $ filter isSpecial $ filter (notElem '0' . show) [98765,98764..1]