factorsOf n = (1 :) $ concatMap (\x -> [x,n`div`x]) $ filter ((==0).mod n) [2..ceiling $ sqrt $ fromIntegral n]

d = sum . factorsOf 

isAmicable x = d (d x) == x && d x /= x

main = print $ sum $ filter isAmicable [1..9999]
