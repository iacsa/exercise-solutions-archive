module LargestSeriesProduct
  exposing ( largestProduct
           )


largestProduct : Int -> String -> Maybe Int
largestProduct span numberString =
  if span < 0 then
    Nothing
  else
    let
      sublists list =
        List.range 0 (String.length numberString - span)
          |> List.map (\n -> List.drop n list |> List.take span)
      products =
        List.map (List.foldl (*) 1)
    in
      numberString
        |> String.toList
        |> List.map (String.fromChar >> String.toInt)
        |> List.foldr (Result.map2 (::)) (Ok [])
        |> Result.toMaybe
        |> Maybe.andThen (sublists >> products >> List.maximum)
