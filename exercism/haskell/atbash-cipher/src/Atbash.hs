module Atbash (encode, decode) where

import Data.Char (isAlphaNum, isAlpha, isAscii, ord, chr, toLower)
import Data.List.Split (chunksOf)

translate :: String -> String
translate = map (\c -> if isAlpha c then chr $ 219 - ord (toLower c) else c)

validate :: String -> String
validate = filter isAlphaNum . filter isAscii

encode :: String -> String
encode = unwords . chunk . translate . validate
  where
    chunk = chunksOf 5

decode :: String -> String
decode = translate . validate
