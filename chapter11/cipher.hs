module Cipher where

import Data.Char

type OriginalMessage = String
type EncodedMessage  = String
type Keyword         = String

alphabetLength :: Int
alphabetLength = length ['a'..'z']

-- Encodes a message using Vigenere cipher
vigenere :: OriginalMessage -> Keyword -> EncodedMessage
vigenere original keyword = map aux (lineUp original keyword)
  where aux (c1, c2) = rightShift c1 (shiftsToMake c2)

-- Decodes a message using Vigenere cipher
unVigenere :: EncodedMessage -> Keyword -> OriginalMessage
unVigenere encoded keyword = map aux (lineUp encoded keyword)
  where aux (c1, c2) = rightShift c1 (alphabetLength - shiftsToMake c2)

-- Lines up the original message characters with keyword ones
lineUp :: OriginalMessage -> Keyword -> [(Char, Char)]
lineUp _ ""             = error "keyword cannot be an empty string"
lineUp original keyword = aux original (cycle keyword)
  where aux "" _          = []
        aux (' ':xs) ys   = (' ', ' ') : aux xs ys
        aux (x:xs) (y:ys) = (x, y) : aux xs (cycle ys)

-- Right shifts a character the specified amount of times
rightShift :: Char -> Int -> Char
rightShift c n
  | isUpper c = chr $ ((ord c - ord 'A' + n) `mod` alphabetLength) + ord 'A'
  | isLower c = chr $ ((ord c - ord 'a' + n) `mod` alphabetLength) + ord 'a'
  | otherwise = c

-- Returns how many shifts should be made for a given character
shiftsToMake :: Char -> Int
shiftsToMake c
  | isUpper c = ord c - ord 'A'
  | isLower c = ord c - ord 'a'
  | otherwise = error "character must be a letter"

testVigenere :: Bool
testVigenere = "MPPR AE OYWY" == vigenere "MEET AT DAWN" "ALLY"

testUnVigenere :: Bool
testUnVigenere = "MEET AT DAWN" == unVigenere "MPPR AE OYWY" "ALLY"
