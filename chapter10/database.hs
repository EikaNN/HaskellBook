module Database where

import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime
            (fromGregorian 1911 5 1)
            (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbString "Hello, world!"
  , DbDate (UTCTime
            (fromGregorian 1921 5 1)
            (secondsToDiffTime 34123))
  ]

-- filter DbDate values and return a list of the date values inside them
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate dbItems = [date | DbDate date <- dbItems]

-- filter DbNumber values and return a list of the integer values inside them
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber dbItems = [number | DbNumber number <- dbItems]

-- get the most recent date
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

-- sum all DbNumber values
sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber

-- get the average of DbNumber values
avgDb :: [DatabaseItem] -> Double
avgDb dbItems = (fromIntegral $ sumDb dbItems) / (fromIntegral $ length numbers)
  where numbers = filterDbNumber dbItems
