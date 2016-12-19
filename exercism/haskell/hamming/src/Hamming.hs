module Hamming (distance) where

distance :: String -> String -> Maybe Integer
distance s1 s2
  | length s1 == length s2 = Just $ sum [1 | (c1, c2) <- zip s1 s2, c1 /= c2]
  | otherwise = Nothing
