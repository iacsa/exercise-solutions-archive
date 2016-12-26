module WordCount
  exposing ( wordCount
           )

import Dict
import Regex


type alias WordCounts =
  Dict.Dict String Int


increment : String -> WordCounts -> WordCounts
increment word =
  Dict.update word (Maybe.withDefault 0 >> (+) 1 >> Just)


wordCount : String -> WordCounts
wordCount text =
  text
    |> String.toLower
    |> split
    |> List.foldl increment Dict.empty


split : String -> List String
split text =
  text
    |> Regex.find Regex.All (Regex.regex "[\\w\\d]('*[\\w\\d])*")
    |> List.map .match
