module Either where

example :: [Either Int String]
example = [Left 1, Right "hello", Left 2, Right "world"]


lefts :: [Either a b] -> [a]
lefts = foldr go []
  where go (Left  x) acc = x : acc
        go (Right _) acc = acc

testLefts :: Bool
testLefts = [1, 2] == lefts example


rights :: [Either a b] -> [b]
rights = foldr go []
  where go (Left  _) acc = acc
        go (Right x) acc = x : acc

testRights :: Bool
testRights = ["hello", "world"] == rights example


partitionEithers :: [Either a b] -> ([a], [b])
partitionEithers xs = (lefts xs, rights xs)

testPartitionEithers :: Bool
testPartitionEithers = ([1, 2], ["hello", "world"]) == partitionEithers example


eitherMaybe :: (b -> c) -> Either a b -> Maybe c
eitherMaybe _ (Left _)  = Nothing
eitherMaybe f (Right b) = Just $ f b

testEitherMaybe :: Bool
testEitherMaybe = and
  [
    Nothing == eitherMaybe (+1) (Left "hello"),
    Just 2  == eitherMaybe (+1) (Right 1)
  ]


either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f _ (Left a)  = f a
either' _ f (Right b) = f b

testEither' :: Bool
testEither' = and
  [
    2 == either' (+1) id (Left 1),
    1 == either' (+1) id (Right 1)
  ]


eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' f = either' (\_ -> Nothing) (\x -> Just $ f x)

testEitherMaybe' :: Bool
testEitherMaybe' = and
  [
    Nothing == eitherMaybe' (+1) (Left "hello"),
    Just 2  == eitherMaybe' (+1) (Right 1)
  ]
