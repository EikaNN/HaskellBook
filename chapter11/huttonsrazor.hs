module HuttonsRazor where

data Expr = Lit Integer | Add Expr Expr

-- Evaluates an expression
eval :: Expr -> Integer
eval (Lit n)     = n
eval (Add e1 e2) = eval e1 + eval e2

testEval :: Bool
testEval = 9002 == eval (Add (Lit 1) (Lit 9001))


-- Prints an expression
printExpr :: Expr -> String
printExpr (Lit n)     = show n
printExpr (Add e1 e2) = printExpr e1 ++ " + " ++ printExpr e2

testPrintExpr :: Bool
testPrintExpr = "1 + 9001 + 1 + 20001" == printExpr a3
  where a1 = Add (Lit 9001) (Lit 1)
        a2 = Add a1 (Lit 20001)
        a3 = Add (Lit 1) a2
