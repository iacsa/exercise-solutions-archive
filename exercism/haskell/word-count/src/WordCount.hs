{-# LANGUAGE TupleSections #-}

module WordCount (wordCount) where

import Data.Map (Map, fromListWith)
import Data.Char (toLower, isAlphaNum)

wordCount :: String -> Map String Int
wordCount = count . tokenize
  where
    count = fromListWith (+) . map ((,1) . map toLower)
    tokenize = filter (not . null) . split

split :: String -> [String]
split "" = []
split (c : s)
  | isAlphaNum c = word [c] s
  | otherwise = split s
  where
    word :: String -> String -> [String]
    word w [] = [w]
    word w (c1 : c2 : s)
      | c1 == '\'' && isAlphaNum c2 = word (w ++ [c1, c2]) s
    word w (c : s)
      | isAlphaNum c = word (w ++ [c]) s
      | otherwise = w : split s

