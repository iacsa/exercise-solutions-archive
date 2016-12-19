module CryptoSquare (encode) where

import Data.Char (isAlphaNum, toLower)
import Data.List (transpose)
import Data.List.Split (chunksOf)

normalizePlaintext :: String -> String
normalizePlaintext = filter isAlphaNum . map toLower

squareSize :: String -> Int
squareSize = ceiling . sqrt . fromIntegral . length

plaintextSegments :: String -> [String]
plaintextSegments str = chunksOf (squareSize text) text
  where text = normalizePlaintext str

encode :: String -> String
encode = unwords . transpose . plaintextSegments
