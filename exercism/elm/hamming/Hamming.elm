module Hamming
  exposing ( distance
           )


distance : String -> String -> Maybe Int
distance string1 string2 =
  if String.length string1 /= String.length string2 then
    Nothing
  else
    let
      chars1 =
        String.toList string1
      chars2 =
        String.toList string2
    in
      List.map2 (/=) chars1 chars2
        |> List.filter identity
        |> List.length
        |> Just
