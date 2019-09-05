# Chapter 12: Signaling adversity

## Chapter Exercises

### Determine the kinds

1) `a :: *`
2) `a :: *` and `f :: * -> *`

### String processing

[stringProcessing.hs](stringProcessing.hs)

### Validate the word

[validateWord.hs](validateWord.hs)

### It's only Natural

[natural.hs](natural.hs)

### Small library for Maybe

[maybe.hs](maybe.hs)

### Small library for Either

[either.hs](either.hs)

### Write your own iterate and unfoldr

1)
```haskell
myIterate :: (a -> a) -> a -> [a]
myIterate f a = a : myIterate f (f a)
```

2)
```haskell
myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr f b = case f b of
  Nothing     -> []
  Just (a, b) -> a : myUnfoldr f b
```

3)
```haskell
betterIterate :: (a -> a) -> a -> [a]
betterIterate f x = myUnfoldr (\x -> Just (x, f x)) x
```

### Finally something other than a list!

[tree.hs](tree.hs)
