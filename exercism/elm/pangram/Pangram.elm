module Pangram exposing (isPangram)


alphabet : List String
alphabet =
  "abcdefghijklmnopqrstuvwxyz"
    |> String.toList
    |> List.map String.fromChar


isPangram : String -> Bool
isPangram text =
  let
    lowerText =
      String.toLower text
    contained =
      (flip String.contains) lowerText
  in
    List.all contained alphabet
