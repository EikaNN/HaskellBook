# Chapter 6: Typeclasses

## Eq Instances

1)
```haskell
data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where
    TisAn x == TisAn y = x == y
```

2)
```haskell
data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
    Two x y == Two x' y' = x == x' && y == y'
```

3)
```haskell
data StringOrInt = TisAnInt Int | TisAString String

instance Eq StringOrInt where
    TisAnInt x   == TisAnInt y   = x == y
    TisAString x == TisAString y = x == y
    _ == _                       = False
```

4)
```haskell
data Pair a = Pair a a

instance Eq a => Eq (Pair a) where
    Pair x y == Pair x' y' = x == x' && y == y'
```

5)
```haskell
data Tuple a b = Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
    Tuple x y == Tuple x' y' = x == x' && y == y'
```

6)
```haskell
data Which a = ThisOne a | ThatOne a

instance Eq a => Eq (Which a) where
    ThisOne x == ThisOne y = x == y
    ThatOne x == ThatOne y = x == y
    _ == _                 = False
```

7)
```haskell
data EitherOr a b = Hello a | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
    Hello x   == Hello y   = x == y
    Goodbye x == Goodbye y = x == y
    _ == _                 = False
```

## Will they work?

1) yes
2) yes
3) no
4) yes

## Chapter Exercises

### Multiple choice

1) c)
2) b)
3) a)
4) c)
5) a)

### Does it typecheck?

1) No, because `Person` is not an instance of `Show`.
```haskell
data Person = Person Bool deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)
```

2) No, because `Mood` is not an instance of `Eq`.
```haskell
data Mood = Blah | Woot deriving (Eq, Show)

settleDown :: Mood -> Mood
settleDown x = if x == Woot then Blah else x
```

3)
    a) Acceptable inputs are either `Blah` or `Woot`.
    b) An error will be thrown as 9 does not belong to `Mood` class.
    c) An error will be thrown as `Mood` is not an instance of `Ord`.

4) It typechecks, but note that `s1` is a function `Object -> Sentence` and not a `String`.

### Give a datatype declaration, what can we do?

1) No because `Papu` needs a `Rocks` as first argument and a `Yeah` as second argument.
2) Yes
3) Yes
4) No since `Papy` is not an instance of `Ord`.

### Match the types

1) No
2) No
3) Yes
4) Yes
5) Yes
6) Yes
7) No
8) No
9) Yes
10) Yes
11) No

### Type-Kwon-Do Two: Electric Typealoo

1)
```haskell
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk f a b = f a == b
```

2)
```haskell
arith :: Num b => (a -> b) -> Integer -> a -> b
arith f n a = f a + fromInteger n
```
