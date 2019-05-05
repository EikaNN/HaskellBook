# Chapter 8: Recursion

## Intermission

```haskell
applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes 0 f b = b
applyTimes n f b = f (applyTimes (n-1) f b)
```

```
applyTimes 5 (+1) 5
= (+1) (applyTimes 4 (+1) 5)
= (+1) . (+1) $ (applyTimes 3 (+1) 5)
= (+1) . (+1) . (+1) $ (applyTimes 2 (+1) 5)
= (+1) . (+1) . (+1) . (+1) $ (applyTimes 1 (+1) 5)
= (+1) . (+1) . (+1) . (+1) . (+1) $ (applyTimes 0 (+1) 5)
= (+1) . (+1) . (+1) . (+1) . (+1) $ 5
= 10
```

## Chapter Exercises

### Review of types

1) d)
2) b)
3) d)
4) b)

### Reviewing currying

1) `"woops mrow woohoo!"`
2) `"1 mrow haha"`
3) `"woops mrow 2 mrow haha"`
4) `"woops mrow blue mrow haha"`
5) `"pink mrow haha mrow green mrow woops mrow blue"`
6) `"are mrow Pugs mrow awesome"`

### Recursion

1)
```
dividedBy 15 2
= go 15 2 0
-- 15 isn't < 2, so the otherwise branch
= go (15 - 2) 2 (0 + 1)

= go 13 2 1
-- 13 isn't < 2, so the otherwise branch
= go (13 - 2) 2 (1 + 1)

= go 11 2 2
-- 11 isn't < 2, so the otherwise branch
= go (11 - 2) 2 (2 + 1)

= go 9 2 3
-- 9 isn't < 2, so the otherwise branch
= go (9 - 2) 2 (3 + 1)

= go 7 2 4
-- 7 isn't < 2, so the otherwise branch
= go (7 - 2) 2 (4 + 1)

= go 5 2 5
-- 5 isn't < 2, so the otherwise branch
= go (5 - 2) 2 (5 + 1)

= go 3 2 6
-- 3 isn't < 2, so the otherwise branch
= go (3 - 2) 2 (6 + 1)

= go 1 2 7
-- 1 is < 2, so the first branch is satisfied
= (7, 1)
```

2)
```haskell
sum1ToN :: (Eq a, Num a) => a -> a
sum1ToN n = go n 0
  where go n sum
          | n == 0     = sum
          | otherwise = go (n - 1) (sum + n)
```

3)
```haskell
multiply :: (Integral a) => a -> a -> a
multiply x y = go x y 0
  where go x y sum
          | y == 0    = sum
          | otherwise = go x (y - 1) (sum + x)
```

### Fixing dividedBy

This was more tricky than expected! Used [this](https://en.wikipedia.org/wiki/Division_algorithm) to solve it.

```haskell
dividedByUnsigned :: Integral a => a -> a -> (a, a)
dividedByUnsigned num denom = go num denom 0
  where go n d count
          | n < d     = (count, n)
          | otherwise = go (n - d) d (count + 1)

dividedBy :: Integral a => a -> a -> Maybe (a, a)
dividedBy _ 0       = Nothing
dividedBy n d
  | d < 0 =
    let Just (q, r) = dividedBy n (-d)
    in if r == 0 then Just (-q, 0) else Just (-q-1, r+d)
  | n < 0 =
    let Just (q, r) = dividedBy (-n) d
    in if r == 0 then Just (-q, 0) else Just (-q-1, d-r)
  | otherwise = Just $ dividedByUnsigned n d
```

### McCarthy 91 function

```haskell
mc91 :: (Integral a) => a -> a
mc91 n
  | n > 100   = n - 10
  | otherwise = mc91 . mc91 $ n + 11
```

### Numbers into words

[wordNumber.hs](wordNumber.hs)
