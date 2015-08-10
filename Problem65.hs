import Data.List
-- import Data.Ratio
import Debug.Trace

e :: [Integer]
e = 1 : intercalate [1,1] (map ((:[]).(*2)) [1..])

toFrac :: [Integer] -> Rational
toFrac [x] = recip $ fromIntegral x
toFrac (x:xs) = fromIntegral x + recip (toFrac xs)

main :: IO ()
main = print $ 2 + (toFrac $ take 2 e)