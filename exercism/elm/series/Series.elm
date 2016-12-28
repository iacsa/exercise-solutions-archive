module Series
  exposing ( slices
           )


slices : Int -> String -> Result String (List (List Int))
slices size numberString =
  if size <= 0 then
    Err ("Invalid size: " ++ toString size)
  else
    let
      sublists list =
        List.range 0 (String.length numberString - size)
          |> List.map (\n -> List.drop n list |> List.take size)
    in
      numberString
        |> String.toList
        |> List.map (String.fromChar >> String.toInt)
        |> List.foldr (Result.map2 (::)) (Ok [])
        |> Result.map sublists
