module OCR (convert) where

import Data.List (transpose, elemIndex, intercalate)
import Data.List.Split (chunksOf)

shapes = [
    " _ | ||_|   ",
    "     |  |   ",
    " _  _||_    ",
    " _  _| _|   ",
    "   |_|  |   ",
    " _ |_  _|   ",
    " _ |_ |_|   ",
    " _   |  |   ",
    " _ |_||_|   ",
    " _ |_| _|   "
  ]

convert :: String -> String
convert = intercalate "," . map processLine . chunksOf 4 . lines
  where
    processLine = map (parseDigit . concat) . transpose . map (chunksOf 3)
    parseDigit code = case elemIndex code shapes of
      Just n -> head $ show n
      Nothing -> '?'
