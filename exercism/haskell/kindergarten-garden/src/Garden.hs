module Garden (garden, defaultGarden, lookupPlants, Plant(..)) where

import Data.List (sort, transpose)
import Data.List.Split (chunksOf)

data Plant = Radishes
           | Violets
           | Clover
           | Grass
  deriving (Eq, Show)

type Child = String

defaultChildren :: [Child]
defaultChildren = ["Alice", "Bob", "Charlie", "David",
                   "Eve", "Fred", "Ginny", "Harriet",
                   "Ileana", "Joseph", "Kincaid", "Larry"]

plantOfChar :: Char -> Plant
plantOfChar 'R' = Radishes
plantOfChar 'V' = Violets
plantOfChar 'C' = Clover
plantOfChar 'G' = Grass
plantOfChar _ = error "Unknown plant in kindergarten garden!"

defaultGarden :: String -> [(Child, [Plant])]
defaultGarden = garden defaultChildren

garden :: [Child] -> String -> [(Child, [Plant])]
garden children cells = zip (sort children) (plants cells)
  where
    plants = map (map plantOfChar) . parcells
    parcells = map concat . transpose . map (chunksOf 2) . lines

lookupPlants :: Child -> [(Child, [Plant])] -> [Plant]
lookupPlants child = snd . head . filter (\(c, _) -> c == child)
