import Data.Char

isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf [] _ = True
isSubseqOf _ [] = False
isSubseqOf xs@(x:xs') (y:ys)
  | x == y    = isSubseqOf xs' ys
  | otherwise = isSubseqOf xs ys


capitalizeWords :: String -> [(String, String)]
capitalizeWords = map (\x -> (x, capitalizeWord x)) . words

capitalizeWord :: String -> String
capitalizeWord ""     = ""
capitalizeWord (x:xs) = toUpper x : xs

capitalizeParagraph :: String -> String
capitalizeParagraph = capitalizeWord . unwords . aux . words
  where aux (x:y:zs)
          | last x == '.' = x : capitalizeWord y : zs
          | otherwise     = x : y : aux zs
