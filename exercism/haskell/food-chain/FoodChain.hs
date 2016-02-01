{-# OPTIONS_GHC -XLambdaCase #-}

module FoodChain (song) where

special :: Int -> String
special = \case
  0 -> ""
  1 -> "\nIt wriggled and jiggled and tickled inside her."
  2 -> "\nHow absurd to swallow a bird!"
  3 -> "\nImagine that, to swallow a cat!"
  4 -> "\nWhat a hog, to swallow a dog!"
  5 -> "\nJust opened her throat and swallowed a goat!"
  6 -> "\nI don't know how she swallowed a cow!"
  7 -> "\nShe's dead, of course!"
  n -> error $ "Illegal special id: " ++ show n

animal :: Int -> String
animal = \case
  0 -> "fly"
  1 -> "spider"
  2 -> "bird"
  3 -> "cat"
  4 -> "dog"
  5 -> "goat"
  6 -> "cow"
  7 -> "horse"
  n -> error $ "Illegal animal id: " ++ show n

qualifiedAnimal :: Int -> String
qualifiedAnimal n
  | n == 1 = "spider that wriggled and jiggled and tickled inside her"
  | elem n [0 .. 7] = animal n
  | otherwise = error $ "Illegal qualified animal id: " ++ show n

beginning :: Int -> String
beginning n = concat ["I know an old lady who swallowed a ",
                      animal (n - 1),
                      ".",
                      special (n - 1)]

ending :: String
ending = "I don't know why she swallowed the fly. Perhaps she'll die.\n"

song :: String
song = unlines (map verse [1 .. 8]) ++ "\n"

line :: Int -> String
line k = concat ["She swallowed the ",
                 animal k,
                 " to catch the ",
                 qualifiedAnimal (k - 1),
                 "."]

verse :: Int -> String
verse 8 = beginning 8
verse n = unlines (beginning n : map line (reverse [1 .. (n - 1)])) ++ ending
