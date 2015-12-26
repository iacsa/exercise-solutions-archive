module Bob where
import Data.Char (isLower, isSpace, isUpper)

responseFor :: String -> String
responseFor s
  | all isSpace s = "Fine. Be that way!"
  | not (any isLower s) && any isUpper s = "Whoa, chill out!"
  | last s == '?' = "Sure."
  | otherwise = "Whatever."
