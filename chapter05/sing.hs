module Sing where

fstString :: [Char] -> [Char]
fstString = (++) " in the rain"

sndString :: [Char] -> [Char]
sndString = (++) " over the rainbow"

sing :: [Char]
sing = if (x < y) then fstString x else sndString y
  where x = "Singin"
        y = "Somewhere"
