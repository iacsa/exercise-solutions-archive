module Accumulate exposing (accumulate)


accumulate : (a -> b) -> List a -> List b
accumulate f list =
  let
    accumulateReverse f acc xs =
      case xs of
        head :: tail ->
          accumulateReverse f (f head :: acc) tail
        [] ->
          acc
    reverse =
      accumulateReverse identity []
  in
    list
      |> accumulateReverse f []
      |> reverse
