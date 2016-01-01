module CryptoSquare (
  normalizePlaintext,
  squareSize,
  plaintextSegments,
  ciphertext,
  normalizeCiphertext
) where

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

ciphertext :: String -> String
ciphertext = concat . transpose . plaintextSegments

normalizeCiphertext :: String -> String
normalizeCiphertext = unwords . transpose . plaintextSegments