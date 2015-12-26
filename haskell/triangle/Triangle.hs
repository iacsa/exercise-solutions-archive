module Triangle (TriangleType(..), triangleType) where

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illogical
  deriving (Eq, Show)

triangleType :: Int -> Int -> Int -> TriangleType
triangleType a b c
  | a == 0 || b == 0 || c == 0 || impossible = Illogical
  | a == b && b == c = Equilateral
  | a == b || b == c || a == c = Isosceles
  | otherwise = Scalene
  where impossible = 2 * maximum [a, b, c] >= sum [a, b, c]
