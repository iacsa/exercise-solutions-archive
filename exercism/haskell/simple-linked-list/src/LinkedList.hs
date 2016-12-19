module LinkedList (
  new,
  nil,
  toList,
  fromList,
  datum,
  reverseLinkedList,
  next,
  isNil
) where

data List e = Cons e (List e)
            | Nil

new :: e -> List e -> List e
new = Cons

isNil :: List e -> Bool
isNil Nil = True
isNil _ = False

nil :: List e
nil = Nil

datum :: List e -> e
datum (Cons n _) = n

next :: List e -> List e
next (Cons _ ls) = ls

toList :: List e -> [e]
toList Nil = []
toList (Cons n ls) = n : toList ls

fromList :: [e] -> List e
fromList = foldr Cons Nil

reverseLinkedList :: List e -> List e
reverseLinkedList ls = rll ls Nil
  where
    rll Nil = id
    rll (Cons n ls) = rll ls . Cons n
