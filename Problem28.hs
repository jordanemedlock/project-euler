level 0 = ([1],1)
level n = (x, 4*n*2 + p)
  where (_,p) = level (n-1)
        x = map ((+p).(*(n*2))) [1..4]

main = print $ sum $ concatMap (fst.level) [0..500]