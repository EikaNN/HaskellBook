module Tree where

data BinaryTree a = Leaf
                  | Node (BinaryTree a) a (BinaryTree a)
                  deriving (Eq, Ord, Show)

insert :: Ord a => a -> BinaryTree a -> BinaryTree a
insert b Leaf = Node Leaf b Leaf
insert b (Node left a right)
  | b == a = Node left a right
  | b < a  = Node (insert b left) a right
  | b > a  = Node left a (insert b right)

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf                = Leaf
mapTree f (Node left a right) = Node (mapTree f left) (f a) (mapTree f right)

mapExpected :: BinaryTree Integer
mapExpected = Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)

testTree :: BinaryTree Integer
testTree = Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)

mapOkay :: IO ()
mapOkay =
  if mapExpected == mapTree (+1) testTree
  then print "yup okay!"
  else error "test failed!"

testTree' :: BinaryTree Integer
testTree' = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)

preorder :: BinaryTree a -> [a]
preorder Leaf                = []
preorder (Node left a right) = [a] ++ preorder left ++ preorder right

testPreorder :: IO ()
testPreorder =
  if [2, 1, 3] == preorder testTree'
  then putStrLn "Preorder fine!"
  else putStrLn "Bad news bears."

inorder :: BinaryTree a -> [a]
inorder Leaf                = []
inorder (Node left a right) = inorder left ++ [a] ++ inorder right

testInorder :: IO ()
testInorder =
  if [1, 2, 3] == inorder testTree'
  then putStrLn "Inorder fine!"
  else putStrLn "Bad news bears."

postorder :: BinaryTree a -> [a]
postorder Leaf                = []
postorder (Node left a right) = postorder left ++ postorder right ++ [a]

testPostorder :: IO ()
testPostorder =
  if [1, 3, 2] == postorder testTree'
  then putStrLn "Postorder fine!"
  else putStrLn "Bad news bears."

foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
foldTree _ z Leaf = z
foldTree f z (Node left a right) = foldTree f z' right
  where z' = f a (foldTree f z left)
