module Series (largestProduct) where

import Data.Char (digitToInt, isDigit)
import Data.List.Split (divvy)

invalid :: Char -> Bool
invalid = not . isDigit

largestProduct :: Int -> [Char] -> Maybe Int
largestProduct n chars
  | n < 0 || n > length chars = Nothing
  | any invalid chars = Nothing
  | n == 0 = Just 1
  | otherwise = Just $ maximum products
    where products = map product $ divvy n 1 $ map digitToInt chars
