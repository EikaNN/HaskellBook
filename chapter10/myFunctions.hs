module MyFunctions where

-- returns True if any Bool in the list is True
myOr :: [Bool] -> Bool
myOr = foldr (||) False

-- returns True if the a -> Bool applied to any of the values
-- in the list returns True
myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr ((||) . f) False

-- returns True if element a is in the list
myElem1 :: Eq a => a -> [a] -> Bool
myElem1 x = foldr ((||) . (== x)) False

myElem2 :: Eq a => a -> [a] -> Bool
myElem2 x = any (== x)


-- returns the list in reverse order
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

-- same behavior as the built-in map
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

-- same behavior as the built-in filter
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\a acc -> if f a then a : acc else acc) []

-- flattens a list of lists into a list
squish :: [[a]] -> [a]
squish = foldr (++) []

-- maps a function over a list and concatenates the results
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr ((++) . f) []

-- flattens a list of lists into a list
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- returns the greatest element of the list based on the last value
-- that the comparison returned GT for
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ []     = error "cannot get maximum of empty list"
myMaximumBy f (x:xs) = foldl go x xs
  where go = \max a -> if f max a == GT then max else a

-- returns the least element of the list based on the last value
-- that the comparison returned LT for
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ []     = error "cannot get minimum of empty list"
myMinimumBy f (x:xs) = foldl go x xs
  where go = \min a -> if f min a == LT then min else a

-- this also works, but it's a bit harder to understand why ;)
myMinimumBy2 :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy2 f = myMaximumBy (flip f) . reverse
