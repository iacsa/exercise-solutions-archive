module Say
  exposing ( SayError (..)
           , say
           )

import Dict


type SayError
    = Negative
    | TooLarge


say : Int -> Result SayError String
say value =
  if value < 0 then
    Err Negative
  else if value >= 10 ^ 12 then
    Err TooLarge
  else if value == 0 then
    Ok "zero"
  else
    List.map2 (,) (chunk value) suffixes
    |> List.map formatTuple
    |> putAdditionalAnd
    |> List.filterMap identity
    |> List.reverse
    |> String.join " "
    |> Ok


-- use 'and' "correctly"
putAdditionalAnd : List (Maybe String) -> List (Maybe String)
putAdditionalAnd list =
  case list of
    Just x :: Nothing :: rest ->
      if not <| List.any (\x -> x == Nothing) rest then
        Just x :: Just "and" :: rest
      else
        list
    _ -> list


formatTuple : (Int, String) -> Maybe String
formatTuple (value, suffix) =
  sayHundreds value
    |> Maybe.map (\text -> text ++ suffix)


wordDict : Dict.Dict Int String
wordDict =
  Dict.fromList
    [ (1, "one")
    , (2, "two")
    , (3, "three")
    , (4, "four")
    , (5, "five")
    , (6, "six")
    , (7, "seven")
    , (8, "eight")
    , (9, "nine")
    , (10, "ten")
    , (11, "eleven")
    , (12, "twelve")
    , (13, "thirteen")
    , (14, "fourteen")
    , (15, "fifteen")
    , (16, "sixteen")
    , (17, "seventeen")
    , (18, "eighteen")
    , (19, "nineteen")
    , (20, "twenty")
    , (30, "thirty")
    , (40, "forty")
    , (50, "fifty")
    , (60, "sixty")
    , (70, "seventy")
    , (80, "eighty")
    , (90, "ninety")
    ]


lookup : Int -> Maybe String
lookup num =
  Dict.get num wordDict


chunk : Int -> List Int
chunk value =
  if value == 0 then
    []
  else
    (value % 1000) :: chunk (value // 1000)


suffixes : List String
suffixes =
  [ ""
  , " thousand"
  , " million"
  , " billion"
  , " trillion"
  ]


orJoin : Maybe String -> String -> Maybe String -> Maybe String
orJoin m1 sep m2 =
  firstJust
    [ Maybe.map2 (\s1 s2 -> s1 ++ sep ++ s2) m1 m2
    , m1
    , m2
    ]


sayHundreds : Int -> Maybe String
sayHundreds value =
  let
    hundreds = value // 100
    tens = (value % 100) // 10
    ones = value % 10

    hundredsString = 
      lookup hundreds
        |> Maybe.map (\s -> s ++ " hundred")
    tensString =
      firstJust
        [ lookup (10 * tens + ones)
        , orJoin
           (lookup (10 * tens))
           "-"
           (lookup ones)
        ]
  in
    orJoin hundredsString " and " tensString


firstJust : List (Maybe a) -> Maybe a
firstJust =
  List.foldl (\x a -> if a == Nothing then x else a) Nothing
