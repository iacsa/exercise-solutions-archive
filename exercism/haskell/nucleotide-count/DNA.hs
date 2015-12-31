{-# OPTIONS_GHC -XTupleSections #-}
module DNA (count, nucleotideCounts) where
import Data.Map (Map, fromListWith, findWithDefault)

type Nucleotide = Char

nucleotides :: [Nucleotide]
nucleotides = "ATCG"

valid :: Nucleotide -> Bool
valid c = elem c nucleotides || error ("invalid nucleotide '" ++ [c] ++ "'")

count :: Nucleotide -> [Nucleotide] -> Integer
count c
  | valid c = findWithDefault 0 c . nucleotideCounts

nucleotideCounts :: [Nucleotide] -> Map Nucleotide Integer
nucleotideCounts ss
  | all valid ss = fromListWith (+) (defaults ++ map (, 1) ss)
  where defaults = map (, 0) nucleotides
