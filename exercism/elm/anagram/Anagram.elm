module Anagram exposing (detect)


detect : String -> List String -> List String
detect word candidates =
  let
    lowerWord =
      String.toLower word
    sortedWord =
      sort word
    sort text =
      text
        |> String.toLower
        |> String.toList
        |> List.sort
        |> String.fromList
    isAnagram candidate =
      sort candidate == sortedWord &&
      String.toLower candidate /= lowerWord
  in
    List.filter isAnagram candidates
