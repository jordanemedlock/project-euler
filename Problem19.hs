
data Month = January | February | March | April | May | June | July | August | September | October | November | December deriving (Show, Eq)
data DayOfWeek = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday deriving (Show, Eq)
data Date = Date Int Month Int DayOfWeek deriving (Show, Eq)

days :: [DayOfWeek]
days = [Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday]

instance Enum DayOfWeek where
  toEnum x = days !! (x `mod` 7)
  fromEnum x = snd $ head $ filter ((==x).fst) $ zip days [0..]

months :: [Month]
months = [January,February,March,April,May,June,July,August,September,October,November,December]

instance Enum Month where
  toEnum x = months !! (x `mod` 12)
  fromEnum x = snd $ head $ filter ((==x).fst) $ zip months [0..]

instance Enum Date where 
  toEnum x = (iterate succ $ Date 1900 January 1 Monday) !! x
  fromEnum x = length $ takeWhile (/=(Date 1900 January 1 Monday)) $ iterate pred x
  pred (Date year January 1 d) = Date (pred year) December 31 (pred d)
  pred (Date year month 1 d) = Date year month' days (pred d)
    where month' = pred month
          days = daysPerMonth (isLeapYear year) month'
  pred (Date year month day d) = Date year month (pred day) (pred d)

  succ (Date year December 31 d) = Date (succ year) January 1 (succ d)
  succ (Date year month day d) = Date year month' day' (succ d)
    where (month',day') = if daysPerMonth (isLeapYear year) month == day 
                            then (succ month, 1)
                            else (month, succ day)



main :: IO ()
main = do
  let oldest = Date 1901 January 1 Tuesday
  print $ length $ filter (\(Date _ _ d2 d) -> d == Sunday && d2 == 1) $ takeWhile (not.(\(Date y m d _) -> y == 2000 && m == December && d == 31)) $ iterate succ oldest

daysPerMonth True February = 29
daysPerMonth False February = 28
daysPerMonth _ x 
  | x `elem` [September, April, June, November] = 30
  | otherwise = 31

divisibleBy n x = (n `mod` x) == 0

isLeapYear x = if x `divisibleBy` 100 then x `divisibleBy` 400 else x `divisibleBy` 4

dayAt (Date 1900 January 1 d) = Monday
dayAt (Date _ _ _ d) = d 
