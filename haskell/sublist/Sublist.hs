module Sublist where
import Data.List (isInfixOf)

data Sublist = Equal
             | Sublist
             | Superlist
             | Unequal
  deriving (Show, Eq)

sublist :: Eq a => [a] -> [a] -> Sublist
sublist s1 s2
  | s1 == s2 = Equal
  | isInfixOf s1 s2 = Sublist
  | isInfixOf s2 s1 = Superlist
  | otherwise = Unequal
