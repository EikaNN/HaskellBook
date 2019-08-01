# Chapter 10: Folding lists

## Understanding Folds

1) b) c)
2)
```
foldl (flip (*)) 1 [1..3]
f = flip (*)
(((1 `f` 1) `f` 2) `f` 3)
((1 `f` 2) `f` 3)
(2 `f` 3)
6
```
3) c)
4) a)
5)
  a) `foldr (++) ["woot", "WOOT", "woot"]`
  b) `foldr max ' ' "fear is the little death"`
  c) `foldr (&&) True [False, True]`
  d) `foldr (||) False [False, True]`
  e) `foldl (flip $ (++) . show) "" [1..5]`
  f) `foldr (flip const) 'a' [1..5]`
  g) `foldr (flip const) 0 "tacos"`
  h) `foldl const 0 "burritos"`
  i) `foldl const 'z' [1..5]`

## Database Processing

[database.hs](database.hs)

## Scans Exercises

[fibonacci.hs](fibonacci.hs)

## Chapter Exercises

### Warm-up and review

1) [combinations.hs](combinations.hs)

2) `seekritFunc x = div (sum (map length (words x))) (length (words x)) :: String -> Int` computes the average number of characters of the words of `x`

3)
```haskell
seekritFunc :: Fractional a => String -> a
seekritFunc x = fromIntegral totalChars / fromIntegral totalWords
  where totalChars = sum . map length . words $ x
        totalWords = length . words $ x
```

### Rewriting functions using folds

[myFunction.hs](myFunction.hs)
