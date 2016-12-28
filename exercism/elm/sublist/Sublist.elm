module Sublist
  exposing ( version
           , ListComparison (..)
           , sublist
           )


version : Int
version =
  2


type ListComparison
    = Equal
    | Sublist
    | Superlist
    | Unequal


sublist : List a -> List a -> ListComparison
sublist l1 l2 =
  if equal l1 l2 then
    Equal
  else if isSublist l1 l2 then
    Sublist
  else if isSublist l2 l1 then
    Superlist
  else
    Unequal


equal : List a -> List a -> Bool
equal xs ys =
  startsWith xs ys && startsWith ys xs


isSublist : List a -> List a -> Bool
isSublist xs ys =
  case ys of
    z :: zs ->
      startsWith xs ys || isSublist xs zs
    _ ->
      startsWith xs ys


startsWith : List a -> List a -> Bool
startsWith prefix list =
  case (prefix, list) of
    ([], _) ->
      True
    (p :: ps, l :: ls) ->
      p == l && startsWith ps ls
    _ ->
      False
