module Allergies
  exposing ( isAllergicTo
           , toList
           )

import Bitwise
import Dict


allergenScores : Dict.Dict String Int
allergenScores =
  Dict.fromList
    [ ("eggs", 1)
    , ("peanuts", 2)
    , ("shellfish", 4)
    , ("strawberries", 8)
    , ("tomatoes", 16)
    , ("chocolate", 32)
    , ("pollen", 64)
    , ("cats", 128)
    ]


isAllergicTo : String -> Int -> Bool
isAllergicTo allergen score =
  Dict.get allergen allergenScores
    |> Maybe.withDefault 0
    |> Bitwise.and score
    |> (/=) 0


toList : Int -> List String
toList score =
  allergenScores
    |> Dict.keys
    |> List.filter (\allergen -> isAllergicTo allergen score)
