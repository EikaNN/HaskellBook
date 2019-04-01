# Chapter 5: Types

## Type Matching

1)
    a) `not :: Bool -> Bool`
    b) `length :: [a] -> Int`
    c) `concat :: [[a]] -> [a]`
    d) `head :: [a] -> a`
    e) `(<) :: Ord a => a -> a -> Bool`

## Type Arguments

1) a)
2) d)
3) d)
4) c)
5) a)
6) e)
7) d)
8) a)
9) c)

## Parametricity

1) `f a = a`
2) `f a1 a2 = a1` or `f a1 a2 = a2`
3) `f a b = b`

## Apply Yourself

1) `myConcat :: [Char] -> [Char]`
2) `myMult :: Fractional a => a -> a`
3) `myTake :: Int -> [Char]`
4) `myCom :: Int -> Bool`
5) `myAlph :: Char -> Bool`


## Chapter Exercises

### Multiple choice

1) c)
2) a)
3) b)
4) c)

### Determine the type

1)
    a) `(* 9) 6 :: Num a => a`
    b) `head [(0, "doge"), (1, "kitteh")] :: Num a => (a, String)`
    c) `head [(0 :: Integer, "doge"), (1, "kitteh")] :: (Integer, String)`
    d) `if False then True else False :: Bool`
    e) `length [1, 2, 3, 4, 5] :: Int`
    f) `(length [1, 2, 3, 4]) > (length "TACOCAT") :: Bool`
2) `w :: Num a => a`
3) `z :: Num a => a -> a`
4) `f :: Fractional a => a`
5) `f :: String`

### Doest it compile?

1)
```haskell
bigNum = (^) 5
wahoo = bigNum $ 10
```
2) OK
3)
```haskell
a = (+)
b = 5
c = a 10
d = c 200
```
4)
```haskell
a = 12 + b
b = 123
```

### Type variable or specific type constructor

1)
```haskell
f :: Num a => a -> b -> Int -> Int`
--           [0]  [1]   [2]    [3]
```
- [0] constrained polymorphic
- [1] fully polymorphic
- [2] concrete
- [3] concrete

2)
```haskell
f :: zed -> Zed -> Blah
--   [0]    [1]    [2]
```
- [0] fully polymorphic
- [1] concrete
- [2] concrete

3)
```haskell
f :: Enum b => a -> b -> C
--            [0]  [1]  [2]
```
- [0] fully polymorphic
- [1] constrained polymorphic
- [2] concrete

4)
```haskell
f :: f -> g -> C
--  [0]  [1]  [2]
```
- [0] fully polymorphic
- [1] fully polymorphic
- [2] concrete

### Write a type signature

1)
```haskell
functionH :: [a] -> a
functionH (x:_) = x
```

2)
```haskell
functionC :: Ord a => a -> a -> Bool
functionC x y = if (x > y) then True else False
```

3)
```haskell
functionS :: (a, b) -> a
functionS (x, y) = y
```

### Given a type, write the function

1)
```haskell
i :: a -> a
i = id
```

2)
```haskell
c :: a -> b -> a
c = const
```

3) Yes, `c''` and `c` are the same thing.
```haskell
c'' :: b -> a -> b
c'' = const
```

4)
```haskell
c' :: a -> b -> b
c' = flip const
```

5)
```haskell
r :: [a] -> [a]
r = id
```
or
```haskell
r :: [a] -> [a]
r = reverse
```

6)
```haskell
co :: (b -> c) -> (a -> b) -> a -> c
co = (.)
```

7)
```haskell
a :: (a -> c) -> a -> a
a = flip const
```

8)
```haskell
a' :: (a -> b) -> a -> b
a' = ($)
```

### Type-Kwon-Do

1)
```haskell
f :: Int -> String
f = undefined

g :: String -> Char
g = undefined

h :: Int -> Char
h = g . f
```

2)
```haskell
data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e = w . q
```

3)
```haskell
data X
data Y
data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)
xform (x, y) = (xz x, yz y)
```

4)
```haskell
munge :: (x -> y) -> (y -> (w, z)) -> x -> w
munge xy ywz = fst . ywz . xy
```
