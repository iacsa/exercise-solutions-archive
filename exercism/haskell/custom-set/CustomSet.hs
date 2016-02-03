module CustomSet (
  CustomSet,
  fromList,
  union,
  toList,
  size,
  insert,
  null,
  empty,
  member,
  delete,
  difference,
  isDisjointFrom,
  intersection,
  isSubsetOf,
) where

import Data.Foldable (toList, foldl')

data CustomSet a = Node a (CustomSet a) (CustomSet a)
                 | Leaf

type T a = CustomSet a

instance Foldable CustomSet where
  foldMap f Leaf = mempty
  foldMap f (Node x l r) = foldMap f l `mappend` f x `mappend` foldMap f r

instance Eq a => Eq (CustomSet a) where
  s1 == s2 = toList s1 == toList s2

instance Show a => Show (CustomSet a) where
  show set = "fromList " ++ show (toList set)

empty :: T a
empty = Leaf

fromList :: Ord a => [a] -> T a
fromList = union empty

union :: (Ord a, Foldable t) => T a -> t a -> T a
union = foldl' (flip insert)

size :: T a -> Int
size = length

insert :: Ord a => a -> T a -> T a
insert x Leaf = Node x Leaf Leaf
insert x (Node y l r)
  | x == y = Node y l r
  | x < y = Node y (insert x l) r
  | otherwise = Node y l (insert x r)

member :: Ord a => a -> T a -> Bool
member _ Leaf = False
member x (Node y l r)
  | x == y = True
  | x < y = member x l
  | otherwise = member x r

delete :: Ord a => a -> T a -> T a
delete _ Leaf = Leaf
delete x (Node y l r)
  | x == y = case l of
      Leaf -> r
      (Node z ll lr) -> Node z (delete z l) r
  | x < y = Node y (delete x l) r
  | otherwise = Node y l (delete x r)

difference :: Ord a => T a -> T a -> T a
difference = foldl' (flip delete)

intersection :: Ord a => T a -> T a -> T a
intersection set = difference set . difference set

isSubsetOf :: Ord a => T a -> T a -> Bool
isSubsetOf set = (== set) . intersection set

isDisjointFrom :: Ord a => T a -> T a -> Bool
isDisjointFrom set = null . intersection set
