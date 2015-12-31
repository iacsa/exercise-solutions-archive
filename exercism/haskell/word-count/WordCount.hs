{-# OPTIONS_GHC -XTupleSections #-}
module WordCount (wordCount) where
import Data.Map.Strict (Map, fromListWith)
import Data.Char (isAlphaNum, toLower)
import Data.List.Split (splitWhen)

wordCount :: String -> Map String Int
wordCount = count . tokenize
  where
    count = fromListWith (+) . map ((,1) . map toLower)
    tokenize = filter (not . null) . splitWhen (not . isAlphaNum)
