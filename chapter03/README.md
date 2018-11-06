# Chapter 3: Strings

## Scope

1) yes
2) no
3) no
4) yes

## Syntax Errors

1) `[1, 2, 3] ++ [4, 5, 6]`
2) `"<3" ++ " Haskell"`
3) `concat ["<3", " Haskell"]`

## Reading Syntax

1)  a) `concat [[1, 2, 3], [4, 5, 6]]`
    b) `(++) [1, 2, 3] [4, 5, 6]`
    c) `(++) "hello" " world"`
    d) `["hello" ++ " world"]`
    e) `"hello" !! 4`
    f) `(!!) "hello" 4`
    g) `take 4 "lovely"`
    h) `take 3 "awesome"`

2)  a) `concat[[1*6], [2*6], [3*6]]` results in `[6, 12, 18]`
    b) `"rain" ++ drop 2 "elbow"` results in `"rainbow"`
    c) `10 * head [1, 2, 3]` results in `10`
    d) `(take 3 "Julie") ++ (tail "yes")` results in `"Jules"`
    e) `concat [tail [1, 2, 3], tail [4, 5, 6], tail [7, 8, 9]]` results in `[2, 3, 5, 6, 8, 9]`

## Building Functions

1)  a) `"Curry is awesome" ++ "!"`
    b) `["Curry is awesome!" !! 4]`
    c) `drop 9 "Curry is awesome!"`
