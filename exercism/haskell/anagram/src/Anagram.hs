module Anagram where
import Data.List (sort)
import Data.Char (toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor word = sortWord `seq` filter (isAnagram . low)
  where
    isAnagram t = (unequal t) && (sameLetters t)
    unequal = (lowWord /=)
    sameLetters = (sortWord ==) . sort
    low = map toLower
    lowWord = low word
    sortWord = sort lowWord
