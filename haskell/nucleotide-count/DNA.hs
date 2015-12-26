{-# OPTIONS_GHC -XTupleSections #-}
module DNA where
import Data.Map (Map, fromListWith, findWithDefault)

type Nucleotide = Char

count :: Nucleotide -> [Nucleotide] -> Integer
count c ss = findWithDefault err c (nucleotideCounts ss)
  where err = error $ "invalid nucleotide '" ++ [c] ++ "'"

nucleotideCounts :: [Nucleotide] -> Map Nucleotide Integer
nucleotideCounts ss = fromListWith (+) (defaults ++ nucleos)
  where
    defaults = map (,0) "ATCG"
    nucleos  = map (,1) ss
