module Phone where

import Data.Char
import Data.List
import Data.Ord
import Control.Applicative

type Digit   = Char
type Symbol  = Char
type Button  = (Digit, [Symbol])
type Layout  = [Button]
type Presses = Int
type Message = String

data Phone = Phone Layout deriving (Show)

phone :: Phone
phone = Phone
  [
    ('1', ['1']),
    ('2', ['a', 'b', 'c', '2']),
    ('3', ['d', 'e', 'f', '3']),
    ('4', ['g', 'h', 'i', '4']),
    ('5', ['j', 'k', 'l', '5']),
    ('6', ['m', 'n', 'o', '6']),
    ('7', ['p', 'q', 'r', 's', '7']),
    ('8', ['t', 'u', 'v', '8']),
    ('9', ['w', 'x', 'y', 'z', '9']),
    ('*', ['^', '*']),
    ('0', [' ', '+', '_', '0']),
    ('#', ['.', ',', '#'])
  ]

conversation :: [Message]
conversation =
  [
    "Wanna play 20 questions",
    "Ya",
    "U 1st haha",
    "Lol ok. Have u ever tasted alcohol",
    "Lol ya",
    "Wow ur cool haha. Ur turn",
    "Ok. Do u think I am pretty Lol",
    "Lol ya",
    "Just making sure rofl ur turn"
  ]

-- Returns the digits we have to press to type the given message
keyPresses :: Phone -> Message -> Maybe [(Digit, Presses)]
keyPresses p = liftA concat . sequence . map (\x -> keyPresses' x p)

-- Returns the digits we have to press to type the given symbol
keyPresses' :: Symbol -> Phone -> Maybe [(Digit, Presses)]
keyPresses' s p
  | isUpper s = (++) <$> keyPresses' '^' p <*> keyPresses' (toLower s) p
  | otherwise = do
      (d, ss) <- getButton s p
      i       <- elemIndex s ss
      return [(d, i + 1)]

-- Returns the button that the symbol belongs to
getButton :: Symbol -> Phone -> Maybe Button
getButton s (Phone l) = find (belongsToButton s) l

-- Returns true if the symbol belongs to the button
belongsToButton :: Symbol -> Button -> Bool
belongsToButton s (_, ss) = s `elem` ss

testKeyPresses :: Bool
testKeyPresses =
  Just [
    ('*',1),('4',2),
    ('3',2),
    ('5',3),
    ('5',3),
    ('6',3)
  ] == keyPresses phone "Hello"


-- Returns how many times do digits need to be pressed for the given message
fingerTaps :: Phone -> Message -> Maybe Presses
fingerTaps p = liftA totalPresses . keyPresses p

totalPresses :: [(Digit, Presses)] -> Presses
totalPresses = sum . map snd

testFingerTaps :: Bool
testFingerTaps = Just 14 == fingerTaps phone "Hello"


-- Returns the most popular letter of a message
mostPopularLetter :: Message -> Char
mostPopularLetter = head . mostPopular

-- Returns the number of presses of the most popular letter of a message
mostPopularLetterCost :: Phone -> Message -> Maybe Presses
mostPopularLetterCost p = liftA (totalPresses . mostPopular) . keyPresses p

-- Returns all the occurrences of the most popular element
mostPopular :: Ord a => [a] -> [a]
mostPopular = maximumBy (comparing length) . group . sort

testMostPopularLetterCost :: Bool
testMostPopularLetterCost = Just 6 == mostPopularLetterCost phone "Hello"


-- Returns the most popular letter overall
coolestLetter :: [Message] -> Char
coolestLetter = mostPopularLetter . unwords

testCoolestLetter :: Bool
testCoolestLetter = ' ' == coolestLetter conversation


-- Returns the most popular word overall
coolestWord :: [Message] -> String
coolestWord = head . mostPopular . words . unwords

testCoolestWord :: Bool
testCoolestWord = "Lol" == coolestWord conversation
