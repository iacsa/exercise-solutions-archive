{-# OPTIONS_GHC -XTupleSections #-}
module DNA where
import Data.Map (Map, fromListWith, findWithDefault)

type Nucleotide = Char

validate :: Nucleotide -> Nucleotide
validate c
  | elem c "ATCG" = c
  | otherwise = error $ "invalid nucleotide '" ++ [c] ++ "'"

count :: Nucleotide -> [Nucleotide] -> Integer
count c ss = findWithDefault 0 (validate c) (nucleotideCounts ss)

nucleotideCounts :: [Nucleotide] -> Map Nucleotide Integer
nucleotideCounts ss = fromListWith (+) (defaults ++ nucleos)
  where
    defaults = map (,0) "ATCG"
    nucleos  = map ((,1) . validate) ss
