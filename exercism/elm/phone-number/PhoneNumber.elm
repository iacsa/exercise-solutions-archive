module PhoneNumber
  exposing ( getNumber
           , prettyPrint
           )

import Char


getNumber : String -> Maybe String
getNumber unsanitized =
  let
    sanitized =
      String.filter Char.isDigit unsanitized
    length =
      String.length sanitized
  in
    if length == 10 then
      Just sanitized
    else if length == 11 && String.startsWith "1" sanitized then
      Just (String.slice 1 11 sanitized)
    else
      Nothing


prettyPrint : String -> Maybe String
prettyPrint unsanitized =
  let
    pp string =
      "(" ++ String.slice 0 3 string ++ ") " ++
        String.slice 3 6 string ++ "-" ++ String.slice 6 10 string
  in
    Maybe.map pp (getNumber unsanitized)
