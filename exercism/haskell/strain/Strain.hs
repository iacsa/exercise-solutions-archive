module Strain where

keep :: (a -> Bool) -> [a] -> [a]
keep _ [] = []
keep p (x:xs)
  | p x = x : rest
  | otherwise = rest
  where rest = keep p xs

discard :: (a -> Bool) -> [a] -> [a]
discard p = keep (not . p)
