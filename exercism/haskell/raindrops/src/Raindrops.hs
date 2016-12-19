module Raindrops (convert) where

sounds :: [(Integer, String)]
sounds = [(3, "Pling"), (5, "Plang"), (7, "Plong")]

convert :: Integer -> String
convert n
  | any divides (map fst sounds) = concat (map makes sounds)
  | otherwise = show n
  where
    divides p = 0 == mod n p
    makes (p, s) = if divides p then s else ""
