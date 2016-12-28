module AtbashCipher
  exposing ( encode
           , decode
           )

import Char
import Regex


encode : String -> String
encode =
  decode >> chunk >> String.join " "


decode : String -> String
decode =
  sanitize >> String.map translate


translate : Char -> Char
translate c =
  if Char.isLower c then
    219 - Char.toCode c |> Char.fromCode
  else
    c
    

sanitize : String -> String
sanitize =
  String.toLower
    >> String.filter (\c -> Char.isLower c || Char.isDigit c)


chunk : String -> List String
chunk =
  Regex.find Regex.All (Regex.regex ".{1,5}")
    >> List.map .match
