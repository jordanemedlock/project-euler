import Data.List.Split
import Data.List

main = do
  text <- readFile "names.txt"
  let names = sum $ zipWith (*) [1..] $ map alphaValue $ sort $ toList text
  print names

toList = splitOn ","

alphaValue = sum . map ((+1).subtract (fromEnum 'A').fromEnum)