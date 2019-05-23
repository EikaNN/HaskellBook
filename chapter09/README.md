# Chapter 9: Lists

## EnumFromTo

```haskell
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
```

## Thy Fearful Symmetry

1)
```haskell
myWords :: String -> [String]
myWords ""       = []
myWords (' ':xs) = myWords xs
myWords xs       = word : myWords rest
  where word = takeWhile (/= ' ') xs
        rest = dropWhile (/= ' ') xs
```

2) [poemLines.hs](poemLines.hs)

3)
```haskell
myWords :: String -> [String]
myWords = mySplitOn ' '

myLines :: String -> [String]
myLines = mySplitOn '\n'

mySplitOn :: Char -> String -> [String]
mySplitOn _ ""              = []
mySplitOn c (x:xs) | x == c = mySplitOn c xs
mySplitOn c xs              = word : mySplitOn c rest
  where word = takeWhile (/= c) xs
        rest = dropWhile (/= c) xs
```

## Square Cube

1)
```haskell
[(x, y) | x <- mySqr, y <- myCube]
```

2)
```haskell
[(x, y) | x <- mySqr, y <- myCube, x < 50, y < 50]
```

3)
```haskell
length [(x, y) | x <- mySqr, y <- myCube, x < 50, y < 50]
```

## Bottom Madness

### Will it blow up?

1) blows up
2) works
3) blows up
4) works
5) blows up
6) works
7) blows up
8) works
9) works
10) blows up

### Intermission: Is it in normal form?

1) normal form, which implies weak head normal form
2) weak head normal form only
3) weak head normal form only
4) normal form, which implies weak head normal form
5) normal form, which implies weak head normal form
6) neither
7) neither

## More Bottoms

1) bottom
2) return a value
3) bottom
4) the function has type `itIsMystery :: String -> [Bool]` and the result indicates whether or not each character of the input is a vowel
5)
  a) `[1,4,9,16,25,36,49,64,81,100]`
  b) `[1,10,20]`
  c) `[15,15,15]`
6)
```haskell
map (\x -> bool x (-x) (x == 3)) [1..10]
```

## Filtering

1)
```haskell
filter (\x -> (mod x 3) == 0) [1..30]
```

2)
```haskell
length . filter (\x -> (mod x 3) == 0) $ [1..30]
```

3)
```haskell
myFilter :: String -> [String]
myFilter = filter (\w -> not . elem w $ ["the","a","an"]) . words
```

## Zipping

1)
```haskell
myZip :: [a] -> [b] -> [(a, b)]
myZip [] _          = []
myZip _ []          = []
myZip (x:xs) (y:ys) = (x, y) : myZip xs ys
```

2)
```haskell
myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ [] _          = []
myZipWith _ _ []          = []
myZipWith f (x:xs) (y:ys) =  f x y : myZipWith f xs ys
```

3)
```haskell
myZip2 :: [a] -> [b] -> [(a, b)]
myZip2 = myZipWith (,)
```

## Chapter Exercises

### Data.Char

1)
```haskell
isUpper :: Char -> Bool
toUpper :: Char -> Char
```

2)
```haskell
filter isUpper "HbEfLrLxO"
```

3)
```haskell
capitalize :: String -> String
capitalize ""     = ""
capitalize (x:xs) = toUpper x : xs
```

4)
```haskell
allCaps :: String -> String
allCaps ""     = ""
allCaps (x:xs) = toUpper x : allCaps xs
```

5) 6)
```haskell
firstLetterCapitalized :: String -> Char
firstLetterCapitalized = toUpper . head
```

### Ciphers

[cipher.hs](cipher.hs)

### Writing your own standard functions

1)
```haskell
myOr :: [Bool] -> Bool
myOr []     = False
myOr (x:xs) = x || myOr xs
```

2)
```haskell
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ []     = False
myAny f (x:xs) = f x || myAny f xs
```

3)
```haskell
myElem :: Eq a => a -> [a] -> Bool
myElem _ []   = False
myElem x' (x:xs)
  | x' == x   = True
  | otherwise = myElem x' xs

myElem :: Eq a => a -> [a] -> Bool
myElem x = any (== x)
```

4)
```haskell
myReverse :: [a] -> [a]
myReverse []     = []
myReverse (x:xs) = myReverse xs ++ [x]
```

5)
```haskell
squish :: [[a]] -> [a]
squish []     = []
squish (x:xs) = x ++ squish xs
```

6)
```haskell
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ []     = []
squishMap f (x:xs) = f x ++ squishMap f xs
```

7)
```haskell
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id
```

8)
```haskell
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ []  = error "cannot get maximum of empty list"
myMaximumBy _ [x] = x
myMaximumBy f (x:xs)
  | f x y == GT = x
  | otherwise   = y
  where y = myMaximumBy f xs
```

9)
```haskell
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f = myMaximumBy $ flip f
```

10)
```haskell
myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
```
