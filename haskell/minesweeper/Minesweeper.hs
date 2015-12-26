module Minesweeper (annotate) where

annotate :: [[Char]] -> [[Char]]
annotate board = [[char y x | x <- [0..w]] | y <- [0..h]]
  where
    h = length board - 1
    w = length (head board) - 1
    isMine y x = (board !! y) !! x == '*'
    char y x
      | isMine y x = '*'
      | otherwise = case minesAround y x of
        0 -> ' '
        n -> head $ show n
    minesAround y x = length [(a, b) | a <- [max 0 (x - 1) .. min w (x + 1)],
                                       b <- [max 0 (y - 1) .. min h (y + 1)],
                                       isMine b a]
