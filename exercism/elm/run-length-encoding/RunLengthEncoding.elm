module RunLengthEncoding
  exposing ( version
           , encode
           , decode
           )

import Regex


version : Int
version =
  2  


encodeMatch : Regex.Match -> String
encodeMatch match =
  let
    length =
      String.length match.match
    char =
      case match.submatches of
        [Just c] ->
          c
        _ ->
          "" -- unreachable
  in
    if length > 1 then
      toString length ++ char
    else
      char
      

encode : String -> String
encode =
  Regex.replace Regex.All (Regex.regex "(.)\\1*") encodeMatch


decodeMatch : Regex.Match -> String
decodeMatch match =
  let
    (char, count) =
      case match.submatches of
        [Just x, Just c] ->
          String.toInt x
            |> Result.withDefault 1
            |> (,) c
        _ ->
          ("", 0) -- unreachable
  in
    String.repeat count char


decode : String -> String
decode =
  Regex.replace Regex.All (Regex.regex "(\\d*)([^\\d])") decodeMatch
