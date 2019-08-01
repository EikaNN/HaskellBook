module Combinations where

stops :: String
stops = "pbtdkg"

vowels :: String
vowels = "aeiou"

-- generate all possible stop-vowel-stop combinations
combinations :: [(Char, Char, Char)]
combinations = [(s1, v, s2) | s1 <- stops, v <- vowels, s2 <- stops]

-- generate all possible stop-vowel-stop combinations starting with p
combinationsStartingWithP :: [(Char, Char, Char)]
combinationsStartingWithP = filter (\(x, _, _) -> x == 'p') combinations

nouns :: [String]
nouns = ["dog", "cat", "fish"]

verbs :: [String]
verbs = ["eats", "loves", "plays"]

-- generate all possible noun-verb-noun sentences
sentences :: [String]
sentences = [unwords [n1, v, n2] | n1 <- nouns, v <- verbs, n2 <- nouns]
