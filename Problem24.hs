import Data.List
import Control.Monad
lexPer = sort $ permutations ['0'..'9']
main = print $ lexPer !! 999999