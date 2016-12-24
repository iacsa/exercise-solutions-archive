module Bob exposing (hey)

import String exposing (endsWith, any, trim, isEmpty)
import Char exposing (isUpper, isLower)

hey : String -> String
hey query =
  if (isEmpty (trim query)) then "Fine. Be that way!"
  else if (any isUpper query) && not (any isLower query) then "Whoa, chill out!"
  else if (endsWith "?" query) then "Sure."
  else "Whatever."
