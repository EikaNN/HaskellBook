# Chapter 7: More functional patterns

## Grab Bag

1) All a) b) c) and d) are equivalent
2) b)
3)
    a)
    ```haskell
    addOneIfOdd n = case odd n of
        True  -> f n
        False -> n
        where f = \n -> n + 1
    ```
    b)
    ```haskell
    addFive = \x -> \y -> (if x > y then y else x) + 5
    ```
    c)
    ```haskell
    mflip f x y = f y x
    ```

## Variety Pack

1)
    a) `k :: (a, b) -> a`
    b) `k2 :: String` while `k1 :: Num a => a` and `k3 :: Num a => a`
    c) `k1` and `k3`
2)
```haskell
f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, b, c) (d, e, f) = ((a, d), (c, f))
```

## Case Practice

1)
```haskell
functionC :: Ord a => a -> a -> Bool
functionC x y = case x > y of
    True  -> x
    False -> y
```
2)
```haskell
ifEvenAdd2 :: Integral a => a -> a
ifEvenAdd2 n = case even n of
    True  -> n + 2
    False -> n
```
3)
```haskell
nums :: (Ord a, Num a, Num b) => a -> b
nums x = case compare x 0 of
  LT -> -1
  GT -> 1
  EQ -> 0
```

## Artful Dodgy

1) 1
2) 11
3) 22
4) 21
5) 12
6) 11
7) 21
8) 21
9) 22
10) 31
11) 23

## Guard Duty

1) `avgGrade 90` evaluates to `'A'`, `avgGrade 75` evaluates to `'C'` and `avgGrade 60` evaluates to `'D'`.
2) If we move `| y >= 0.7 = 'C'` to the top, then `avgGrade 90` evaluates to `'C'`.
3) b)
4) `pal` can take as argument a list of elements which are instance of `Eq` typeclass.
5) `pal :: Eq a => [a] -> Bool`
6) c)
7) `numbers` can take as argument a type which is instance of `Ord` and `Eq` typeclasses.
8) `numbers :: (Ord a, Num a, Num b) => a -> b`

## Chapter Exercises

### Multiple choice

1) d)
2) b)
3) d)
4) b)
5) a)

### Let's write code

1)
    a)
    ```haskell
    tensDigit :: Integral a => a -> a
    tensDigit x = d
    where (xLast, _) = x `divMod` 10
          (_, d)     = xLast `divMod` 10
    ```
    b) Yes, it has the same type
    c)
    ```haskell
    hunsD :: Integral a => a -> a
    hunsD x = d2
    where (xLast, _)  = x `divMod` 10
          (xLast', _) = xLast `divMod` 10
          (_, d2)     = xLast' `divMod` 10
    ```

2)
```haskell
foldBool1 :: a -> a -> Bool -> a
foldBool1 x y b = case b of
  True  -> x
  False -> y

foldBool2 :: a -> a -> Bool -> a
foldBool2 x y b
  | b         = x
  | otherwise = y
```
3)
```haskell
g :: (a -> b) -> (a, c) -> (b, c)
g f (a, c) = (f a, c)
```
4) [arith4.hs](arith4.hs)
5) [arith4.hs](arith4.hs)
6) [arith4.hs](arith4.hs)
