module BST (
  BST,
  empty,
  bstLeft,
  bstRight,
  bstValue,
  singleton,
  insert,
  fromList,
  toList
) where

data BST a = Node a (BST a) (BST a)
           | End
  deriving (Eq, Show)

singleton :: Ord a => a -> BST a
singleton value = Node value End End

bstLeft :: BST a -> Maybe (BST a)
bstLeft (Node _ l _) = Just l
bstLeft End = Nothing

bstRight :: BST a -> Maybe (BST a)
bstRight (Node _ _ r) = Just r
bstRight End = Nothing

bstValue :: BST a -> Maybe a
bstValue (Node v _ _) = Just v
bstValue End = Nothing

insert :: Ord a => a -> BST a -> BST a
insert value End = singleton value
insert value (Node v l r)
  | value <= v = Node v (insert value l) r
  | otherwise = Node v l (insert value r)

fromList :: Ord a => [a] -> BST a
fromList = foldl (flip insert) End

empty :: BST a
empty = End

toList :: BST a -> [a]
toList End = []
toList (Node v l r) = toList l ++ v : toList r
