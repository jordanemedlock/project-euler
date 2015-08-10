import Data.List.Split
import OrdElem

t :: Integral a => a -> a
t n = n*(n+1) `div` 2

triangles :: Integral a => [a]
triangles = map t [1..]

parseWords :: String -> [String]
parseWords = splitOn ","

letterToNumber :: Char -> Int
letterToNumber c = fromEnum c - fromEnum 'A' + 1

wordToNumber :: String -> Int
wordToNumber s = sum $ map letterToNumber s

isTriangular :: Int -> Bool
isTriangular n = n `ordElem` triangles

main :: IO ()
main = do
  s <- readFile "p042_words.txt"
  let words = parseWords s
  print $ length $ filter (isTriangular.wordToNumber) words
