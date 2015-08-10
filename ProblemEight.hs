import GHC.Exts
import Data.Char
import Data.List
import Control.Applicative

main = print =<< solution <$> concat.lines <$> readFile "ProblemEight.txt"

solution string = maximum $ map product groups
  where digits = map digitToInt string
        groups = map ((take 13).(flip drop digits)) [0..(length digits)-13]

-- euler_8 = do
--    str <- readFile "ProblemEight.txt"
--    print . maximum . map product
--          . foldr (zipWith (:)) (repeat [])
--          . take 13 . tails . map (fromIntegral . digitToInt)
--          . concat . lines $ str