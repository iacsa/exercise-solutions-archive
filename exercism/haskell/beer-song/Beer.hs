module Beer (sing, verse) where

import Data.Char (toUpper)

sing :: Int -> Int -> String
sing upper lower = unlines $ map verse $ reverse [lower .. upper]

verse :: Int -> String
verse n = unlines [
  upcase $ number n ++ " of beer on the wall, " ++ number n ++ " of beer.",
  middle n ++ ", " ++ number (mod (n + 99) 100) ++ " of beer on the wall."
  ]
  where
    number 0 = "no more bottles"
    number 1 = "1 bottle"
    number n = show n ++ " bottles"
    middle 0 = "Go to the store and buy some more"
    middle 1 = "Take it down and pass it around"
    middle n = "Take one down and pass it around"
    upcase (x : xs) = toUpper x : xs
