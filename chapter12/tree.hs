module Tree where

data BinaryTree a = Leaf
                  | Node (BinaryTree a) a (BinaryTree a)
                  deriving (Eq, Ord, Show)

unfold :: (a -> Maybe (a, b, a)) -> a -> BinaryTree b
unfold f a = case f a of
  Nothing -> Leaf
  Just (l, x, r) -> Node (unfold f l) x (unfold f r)

testUnfold :: Bool
testUnfold = Node (Node Leaf 2 Leaf) 1 (Node Leaf 2 Leaf) == unfold f 1
  where f x = if x < 3 then Just (x+1, x, x+1) else Nothing


treeBuild :: Integer -> BinaryTree Integer
treeBuild n = unfold (\x -> if x < n then Just (x+1, x, x+1) else Nothing) 0

testTreeBuild :: Bool
testTreeBuild = Node (Node Leaf 1 Leaf) 0 (Node Leaf 1 Leaf) == treeBuild 2
