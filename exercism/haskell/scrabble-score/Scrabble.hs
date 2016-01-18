module Scrabble (scoreLetter, scoreWord) where

import Data.Char (toUpper)

scoreLetter :: Char -> Int
scoreLetter letter
  | elem c "AEIOULNRST" = 1
  | elem c "DG" = 2
  | elem c "BCMP" = 3
  | elem c "FHVWY" = 4
  | elem c "K" = 5
  | elem c "JX" = 8
  | elem c "QZ" = 10
  | otherwise = error $ "illegal character in scrabble word: " ++ [letter]
  where c = toUpper letter

scoreWord :: [Char] -> Int
scoreWord = sum . map scoreLetter 
