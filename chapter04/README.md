# Chapter 4: Basic Datatypes

## Mood Swing

1) The type constructor is `Mood`
2) We could use the values Blah or Woot
3) We cannot use data constructors in type signatures since we can only use type constructors, so the correct type signature is `changeMood :: Mood -> Mood`
4)
```haskell
changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _    = Blah
```
5) [woot.hs](woot.hs)

## Find the Mistakes

1) `not True && True`
2) `not (x == 6)`
3) `(1 * 2) > 5`
4) `["Merry"] > ["Happy"]`
5) `"1, 2, 3" ++ " look at me!"`

## Chapter Exercises

1) The type signature is `[a] -> Int`
2)
    a) 5
    b) 3
    c) 2
    d) 5
3) The second one will return an error since the type of the denominator is `Int` which is not an instance of `Fractional` typeclass
4) We can use the function `div :: Integral a => a -> a -> a`
5) The type of the expression is `Bool` and we expect True as a result
6) The type of the expression is `Bool` and we expect False as a result
7)
    a) True
    b) Won't work as all elements of a list must be of the same type
    c) 5
    d) False
    e) Won't work as 9 is not a `Bool`
8)
```haskell
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = reverse x == x
```
9)
```haskell
myAbs :: Integer -> Integer
myAbs n = if n < 0 then (-n) else n
```
10)
```haskell
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))
```

### Correcting syntax

1)
```haskell
x :: Int -> Int -> Int
x = (+)

f :: String -> Int
f xs = w `x` 1
  where w = length xs
```
2) `id = \x -> x`
3) `f(a, b) = a`

### Match the function names to their types

1) c)
2) b)
3) a)
4) d)
