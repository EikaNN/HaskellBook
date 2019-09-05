module ValidateWord where

newtype Word' = Word' String deriving (Eq, Show)

vowels :: String
vowels = "aeiou"

countVowels :: String -> Int
countVowels = length . filter (`elem` vowels)

countConsononants :: String -> Int
countConsononants s = length s - countVowels s

mkWord :: String -> Maybe Word'
mkWord w
  | countVowels w > countConsononants w = Nothing
  | otherwise                           = Just $ Word' w

testMkWord :: Bool
testMkWord = and
  [
    Just (Word' "hello")  == mkWord "hello",
    Nothing               == mkWord "aeilau"
  ]
