module Cipher where

import Data.Char

caesar :: Int -> String -> String
caesar = map . rightShift

rightShift :: Int -> Char -> Char
rightShift n c
  | isUpper c = chr $ ((ord c - ord 'A' + n) `mod` 26) + ord 'A'
  | isLower c = chr $ ((ord c - ord 'a' + n) `mod` 26) + ord 'a'
  | otherwise = c

unCaesar :: Int -> String -> String
unCaesar n = map $ rightShift (26 - n)
