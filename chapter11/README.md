# Chapter 11: Algebraic datatypes

## Dog Types

1) `Doggies` is a data constructor
2) The kind is `Doggies :: * -> *`
3) The kind is `Doggies String :: *`
4) The type is `Husky 10 :: Num a => Doggies a`
5) The type is `Husky (10 :: Integer) :: Doggies Integer`
6) The type is `Mastiff "Scooby Doo" :: Doggies String`
7) `DogueDeBordeaux` is both a type and data constructor
8) The type is `DogueDeBordeaux :: doge -> DogueDeBordeaux doge`
9) The type is `DogueDeBordeaux "doggie!" :: DogueDeBordeaux String`

## Vehicles

1) The type is `myCar :: Vehicle`
2) [vehicles.hs](vehicles.hs)
3) [vehicles.hs](vehicles.hs)
4) An error will be thrown

## Cardinality

1) The cardinality of `PugType` is 1
2) The cardinality of `Airline` is 3
3) The cardinality of `Int16` is 65536
4) The cardinality of `Int` is 18446744073709551616 while `Integer` has infinite cardinality
5) The connection is that `2^8 = 256`

## For Example

1) The type is `MakeExample :: Example` and there is an error when the type of `Example` is requested since it's a type constructor
2)
```
λ> :i Example
data Example = MakeExample
instance [safe] Show Example
```
`Example` is instance of `Show` typeclass
3) The difference is `MakeExample :: Int -> Example`

## Logic Goats

[goats.hs](goats.hs)

## Pity the Bool

1) The cardinality of this datatype is 4
2) The cardinality of this datatype is 258

## How Does Your Garden Grow?

```haskell
data Garden2 = Gardenia Gardener
             | Daisy Gardener
             | Rose Gardener
             | Lilac Gardener
             deriving Show
```

## Programmers

[programmers.hs](programmers.hs)

## The Quad

1) 4 + 4 = 8
2) 4 * 4 = 16
3) 4 ^ 4 = 256
4) 2 * 2 * 2 = 8
5) (2 ^ 2) ^ 2 = 16
6) (4 ^ 4) ^ 2 = 65536

## Chapter Exercises

### Multiple choice

1) a)
2) c)
3) b)
4) c)

### Ciphers

[cipher.hs](cipher.hs)

### As-patterns

1)
```haskell
isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf [] _ = True
isSubseqOf _ [] = False
isSubseqOf xs@(x:xs') (y:ys)
  | x == y    = isSubseqOf xs' ys
  | otherwise = isSubseqOf xs ys
```

2)
```haskell
capitalizeWords :: String -> [(String, String)]
capitalizeWords = map (\x -> (x, capitalizeWord x)) . words

capitalizeWord :: String -> String
capitalizeWord ""     = ""
capitalizeWord (x:xs) = toUpper x : xs
```

### Language exercises

1)
```haskell
capitalizeWord :: String -> String
capitalizeWord ""     = ""
capitalizeWord (x:xs) = toUpper x : xs
```

2)
```haskell
capitalizeParagraph :: String -> String
capitalizeParagraph = capitalizeWord . unwords . aux . words
  where aux (x:y:zs)
          | last x == '.' = x : capitalizeWord y : zs
          | otherwise     = x : y : aux zs
```

### Phone exercise
