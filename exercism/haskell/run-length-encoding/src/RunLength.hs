module RunLength (decode, encode) where

import Data.List.Split (keepDelimsR, split, whenElt, dropFinalBlank)
import Data.List (group)
import Data.Char (isDigit)


encode :: String -> String
encode =
  concatMap compact . group
  where
    compact l =
      lengthString (length l) ++ [head l]
    lengthString n =
      if n > 1 then show n else ""


decode :: String -> String
decode =
  concatMap expand . splitCodes
  where
    splitCodes =
      split . dropFinalBlank . keepDelimsR . whenElt $ not . isDigit
    expand code =
      replicate (count code) (last code)
    count code =
      max 1 (read $ '0' : init code)
