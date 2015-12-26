module Allergies (Allergen(..), isAllergicTo, allergies) where

import Data.Bits (testBit)

data Allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats
  deriving (Enum, Eq, Show)

isAllergicTo :: Allergen -> Integer -> Bool
isAllergicTo allergen score = testBit score (fromEnum allergen)

allergies :: Integer -> [Allergen]
allergies score = filter (flip isAllergicTo $ score) [Eggs ..]
