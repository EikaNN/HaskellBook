module StringFunctions where

exclaim :: String -> String
exclaim s = s ++ "!"

fifthLetter :: String -> String
fifthLetter s = [s !! 4]

drop9 :: String -> String
drop9 s = drop 9 s

thirdCharacter :: String -> Char
thirdCharacter s = s !! 2

characterIndex :: Int -> Char
characterIndex i = "Curry is awesome!" !! i
