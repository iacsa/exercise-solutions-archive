module BST (
  bstLeft,
  bstRight,
  bstValue,
  singleton,
  insert,
  fromList,
  toList
) where

data Tree a = Node a (Tree a) (Tree a)
            | End

singleton :: Ord a => a -> Tree a
singleton value = Node value End End

bstLeft :: Tree a -> Maybe (Tree a)
bstLeft (Node _ l _) = Just l
bstLeft End = Nothing

bstRight :: Tree a -> Maybe (Tree a)
bstRight (Node _ _ r) = Just r
bstRight End = Nothing

bstValue :: Tree a -> a
bstValue (Node v _ _) = v
bstValue End = error "bstValue: Called on empty Tree"

insert :: Ord a => a -> Tree a -> Tree a
insert value End = singleton value
insert value (Node v l r)
  | value <= v = Node v (insert value l) r
  | otherwise = Node v l (insert value r)

fromList :: Ord a => [a] -> Tree a
fromList = foldl (flip insert) End

toList :: Tree a -> [a]
toList End = []
toList (Node v l r) = toList l ++ v : toList r
