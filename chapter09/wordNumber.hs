module WordNumber where

eft :: (Enum a) => a -> a -> [a]
eft start end
  | fromEnum start >  fromEnum end = []
  | fromEnum start == fromEnum end = [start]
  | otherwise                      = start : eft (succ start) end

eftBool :: Bool -> Bool -> [Bool]
eftBool = eft

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd = eft

eftInt :: Int -> Int -> [Int]
eftInt = eft

eftChar :: Char -> Char -> [Char]
eftChar = eft

myWords :: String -> [String]
myWords = mySplitOn ' '


myLines :: String -> [String]
myLines ""        = []
myLines ('\n':xs) = myLines xs
myLines xs        = word : myLines rest
  where word = takeWhile (/= '\n') xs
        rest = dropWhile (/= '\n') xs

mySplitOn :: Char -> String -> [String]
mySplitOn _ ""              = []
mySplitOn c (x:xs) | x == c = mySplitOn c xs
mySplitOn c xs              = word : mySplitOn c rest
  where word = takeWhile (/= c) xs
        rest = dropWhile (/= c) xs
