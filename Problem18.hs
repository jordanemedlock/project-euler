import Prelude hiding (Either(..))

toTree :: String -> [[Int]]
toTree s = map (map read.words) $ lines s

main = do
  string <- readFile "Problem18.txt"
  let xs = toTree string
  let sums = map (sumPath (0,0) xs) paths
  print $ maximum sums

data Direction = Left | Right deriving (Show, Eq, Enum)

paths = mapM (const [Left,Right]) [1..15]

move (x,y) Left  = (x,  y+1)
move (x,y) Right = (x+1,y+1)

index tree (x,y) = (tree !! y) !! x

sumPath pos tree (x:xs) = (tree `index` pos) + (sumPath (pos `move` x) tree xs)
sumPath _ _ _ = 0
