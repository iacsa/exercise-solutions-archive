module Series (digits, slices, largestProduct) where

import Data.Char (digitToInt)

digits :: [Char] -> [Int]
digits = map digitToInt

slices :: Int -> [Char] -> [[Int]]
slices 0 _ = [[]]
slices n chars = iterate f (repeat []) !! n
  where
    f = zipWith (:) (digits chars) . drop 1

largestProduct :: Int -> [Char] -> Int
largestProduct n chars = 
  if null products then 1 else maximum products
  where products = map product $ slices n chars
