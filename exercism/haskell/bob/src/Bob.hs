{-# LANGUAGE OverloadedStrings #-}

module Bob (responseFor) where

import Data.Char (isLower, isSpace, isUpper)
import qualified Data.Text as T

strip :: String -> String
strip = T.unpack . T.strip . T.pack

responseFor :: String -> String
responseFor s
  | all isSpace s = "Fine. Be that way!"
  | not (any isLower s) && any isUpper s = "Whoa, chill out!"
  | last (strip s) == '?' = "Sure."
  | otherwise = "Whatever."
