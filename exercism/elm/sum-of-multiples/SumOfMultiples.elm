module SumOfMultiples
  exposing ( sumOfMultiples
           )


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples factors upTo =
  let addIfMultiple n acc =
    if List.any (\k -> n % k == 0) factors then
      acc + n
    else
      acc
  in
    List.range 1 (upTo - 1)
      |> List.foldl addIfMultiple 0 
