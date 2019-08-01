module Fibonacci where

-- generates fibonacci sequence
fibs :: [Integer]
fibs = 1 : scanl (+) 1 fibs

-- returns the nth fibonacci number
fibsN :: Int -> Integer
fibsN x = fibs !! x

-- returns the first 20 fibonacci numbers
first20Fibs :: [Integer]
first20Fibs = take 20 fibs

-- returns the fibonacci numbers that are less than 100
-- (we know that fibonacci sequence always increases)
fibsLessThan100 :: [Integer]
fibsLessThan100 = takeWhile (<100) fibs

--  generates all the factorials
factorials :: [Integer]
factorials = scanl (*) 1 [1..]

-- returns the factorial of a number
factorial :: Int -> Integer
factorial x = factorials !! x
