module Atbash (encode) where

import Data.Char (isAlphaNum, isAlpha, isAscii, ord, chr, toLower)
import Data.List.Split (chunksOf)

encode :: String -> String
encode = unwords . chunk . map translate . map toLower . validate
  where
    chunk = chunksOf 5
    validate = filter isAlphaNum . filter isAscii
    translate c
      | isAlpha c = chr $ offset - ord c
      | otherwise = c
    offset = ord 'z' + ord 'a'
