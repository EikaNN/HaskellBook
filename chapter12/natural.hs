module Natural where

data Nat = Zero | Succ Nat deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ n) = 1 + natToInteger n

testNatToInteger :: Bool
testNatToInteger = 2 == natToInteger (Succ (Succ Zero))

integerToNat :: Integer -> Maybe Nat
integerToNat n
  | n < 0     = Nothing
  | n == 0    = Just Zero
  | otherwise = Succ <$> integerToNat (n-1)

testIntegerToNat :: Bool
testIntegerToNat = and
  [
    Nothing                 == integerToNat (-1),
    Just (Succ (Succ Zero)) == integerToNat 2
  ]
