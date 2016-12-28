module ListOps
  exposing ( length
           , reverse
           , map
           , filter
           , foldl
           , foldr
           , append
           , concat
           )


length : List a -> Int
length =
  foldl (always ((+) 1)) 0


reverse : List a -> List a
reverse =
  foldl (::) []


map : (a -> b) -> List a -> List b
map f =
  foldr (\x a -> f x :: a) []


filter : (a -> Bool) -> List a -> List a
filter p =
  foldr (\x -> if p x then (::) x else identity) []


foldr : (a -> b -> b) -> b -> List a -> b
foldr f init =
  reverse >> foldl f init


foldl : (a -> b -> b) -> b -> List a -> b
foldl f init xs =
  case xs of
    head :: tail ->
      foldl f (f head init) tail
    [] ->
      init


append : List a -> List a -> List a
append =
  flip (foldr (::))


concat : List (List a) -> List a
concat =
  foldr append []
