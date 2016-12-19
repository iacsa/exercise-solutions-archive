{-# LANGUAGE TupleSections #-}

module DNA (count, nucleotideCounts) where

import Data.Map (Map, fromListWith, findWithDefault)
import Data.Bifunctor (second)

type Nucleotide = Char

nucleotides :: [Nucleotide]
nucleotides = "ATCG"

valid :: Nucleotide -> Bool
valid c = elem c nucleotides

count :: Nucleotide -> [Nucleotide] -> Either String Integer
count c
  | valid c = second (findWithDefault 0 c) . nucleotideCounts
  | otherwise = const $ Left "Illegal nucleotide character."

nucleotideCounts :: [Nucleotide] -> Either String (Map Nucleotide Integer)
nucleotideCounts ss
  | all valid ss = Right $ fromListWith (+) (defaults ++ map (, 1) ss)
  | otherwise = Left "Illegal character in dna sequence."
  where defaults = map (, 0) nucleotides
