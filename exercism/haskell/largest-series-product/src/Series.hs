module Series (largestProduct) where

import Data.Char (digitToInt, isDigit)

slices :: Int -> [Char] -> [[Int]]
slices 0 _ = [[]]
slices n chars
  | n <= length chars = (map digitToInt $ take n chars) : (slices n $ tail chars)
  | otherwise = []

invalid :: Char -> Bool
invalid = not . isDigit

largestProduct :: Int -> [Char] -> Maybe Int
largestProduct n chars
  | n < 0 || n > length chars = Nothing
  | any invalid chars = Nothing
  | otherwise = Just $ maximum products
    where products = map product $ slices n chars
