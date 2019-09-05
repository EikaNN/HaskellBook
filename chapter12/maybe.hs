module Maybe where

isJust :: Maybe a -> Bool
isJust Nothing  = False
isJust _        = True

testIsJust :: Bool
testIsJust = and
  [
    True  == isJust (Just 1),
    False == isJust Nothing
  ]

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing _       = False

testIsNothing :: Bool
testIsNothing = and
  [
    False == isNothing (Just 1),
    True  == isNothing Nothing
  ]


mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee b _ Nothing  = b
mayybee _ f (Just a) = f a

testMayybee :: Bool
testMayybee = and
  [
    0 == mayybee 0 (+1) Nothing,
    2 == mayybee 0 (+1) (Just 1)
  ]


fromMaybe :: a -> Maybe a -> a
fromMaybe a = mayybee a id

testFromMaybe :: Bool
testFromMaybe = and
  [
    0 == fromMaybe 0 Nothing,
    1 == fromMaybe 0 (Just 1)
  ]


listToMaybe :: [a] -> Maybe a
listToMaybe []    = Nothing
listToMaybe (x:_) = Just x

testListToMaybe :: Bool
testListToMaybe = and
  [
    Just 1  == listToMaybe [1, 2, 3],
    Nothing == listToMaybe ([] :: [Int])
  ]

maybeToList :: Maybe a -> [a]
maybeToList Nothing  = []
maybeToList (Just a) = [a]

testMaybeToList :: Bool
testMaybeToList = and
  [
    [1]            == maybeToList (Just 1),
    ([] :: [Int])  == maybeToList Nothing
  ]


catMaybes :: [Maybe a] -> [a]
catMaybes []             = []
catMaybes (Nothing : xs) = catMaybes xs
catMaybes (Just x  : xs) = x : catMaybes xs

testCatMaybes :: Bool
testCatMaybes = and
  [
    [1, 2]        == catMaybes [Just 1, Nothing, Just 2],
    ([] :: [Int]) == catMaybes [Nothing, Nothing, Nothing]
  ]


flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe []             = Just []
flipMaybe (Nothing : _)  = Nothing
flipMaybe (Just x  : xs) =
  case flipMaybe xs of
    Nothing -> Nothing
    Just xs -> Just (x:xs)

testFlipMaybe :: Bool
testFlipMaybe = and
  [
    Just [1, 2, 3] == flipMaybe [Just 1, Just 2, Just 3],
    Nothing        == flipMaybe [Just 1, Nothing, Just 3]
  ]
