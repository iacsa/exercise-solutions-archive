module RomanNumerals
  exposing ( toRoman
           )


romanDigits : List (String, Int)
romanDigits =
  [ ("M", 1000)
  , ("CM", 900)
  , ("D", 500)
  , ("CD", 400)
  , ("C", 100)
  , ("XC", 90)
  , ("L", 50)
  , ("XL", 40)
  , ("X", 10)
  , ("IX", 9)
  , ("V", 5)
  , ("IV", 4)
  , ("I", 1)
  ]


toRoman : Int -> String
toRoman num =
  let
    aux (digit, value) (target, acc) =
      (target % value, acc ++ String.repeat (target // value) digit)
  in
    romanDigits
      |> List.foldl aux (num, "")
      |> Tuple.second
