module Triangle (TriangleType (..), triangleType) where

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
  deriving (Eq, Show, Read)

triangleType :: (Num a, Ord a) => a -> a -> a -> TriangleType
triangleType a b c
  | any (<= 0) [a, b, c] || impossible = Illegal
  | a == b && b == c = Equilateral
  | a == b || b == c || a == c = Isosceles
  | otherwise = Scalene
  where impossible = 2 * maximum [a, b, c] >= sum [a, b, c]
