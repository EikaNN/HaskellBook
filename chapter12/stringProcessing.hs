module StringProcessing where


transformTheToA :: String -> String
transformTheToA "the" = "a"
transformTheToA s     = s

replaceThe :: String -> String
replaceThe = unwords . fmap transformTheToA . words

testReplaceThe :: Bool
testReplaceThe = "a cow loves us" == replaceThe "the cow loves us"


countTheBeforeVowel :: String -> Integer
countTheBeforeVowel s =  sum . zipWith aux w $ tail w
  where w = words s
        aux a b = if (a == "the" && (isVowel . head $ b)) then 1 else 0

isVowel :: Char -> Bool
isVowel c = c `elem` "aeiou"

testCountTheBeforeVowel :: Bool
testCountTheBeforeVowel = and
  [
    0 == countTheBeforeVowel "the cow",
    1 == countTheBeforeVowel "the evil cow"
  ]


countVowels :: String -> Integer
countVowels = fromIntegral . length . filter isVowel

testCountVowels :: Bool
testCountVowels = and
  [
    4 == countVowels "Mikolajczak",
    2 == countVowels "the cow"
  ]
