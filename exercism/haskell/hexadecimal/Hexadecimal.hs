module Hexadecimal (hexToInt) where

import Data.Char (digitToInt, isHexDigit)
import Data.List (foldl')

hexToInt :: [Char] -> Int
hexToInt hex
  | any (not . isHexDigit) hex = 0
  | otherwise = foldl' (\acc digit -> 16 * acc + digitToInt digit) 0 hex
