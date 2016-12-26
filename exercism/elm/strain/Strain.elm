module Strain exposing (discard, keep)


keep : (a -> Bool) -> List a -> List a
keep predicate list =
  let
    keepReverse acc xs =
      case xs of
        head :: tail ->
          if predicate head then
            keepReverse (head :: acc) tail
          else
            keepReverse acc tail
        [] ->
          acc
  in
    list
      |> keepReverse []
      |> List.reverse


discard : (a -> Bool) -> List a -> List a
discard predicate =
  keep (not << predicate)
