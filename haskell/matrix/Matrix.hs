module Matrix (
  Matrix,
  row,
  column,
  rows,
  cols,
  shape,
  transpose,
  reshape,
  flatten,
  fromString,
  fromList
) where

import Data.Vector (Vector)
import qualified Data.Vector as V
import Data.List.Split (chunksOf)

data Matrix a = Matrix (Vector (Vector a))
  deriving (Eq, Show)

fromString :: Read a => String -> Matrix a
fromString = fromList . map parse . lines
  where
    parse s = case reads s of
      (item, rest) : _ -> item : parse rest
      [] -> []

fromList :: [[a]] -> Matrix a
fromList = Matrix . V.fromList . map V.fromList

flatten :: Matrix a -> Vector a
flatten (Matrix v) = V.concat $ V.toList v

transpose :: Matrix a -> Matrix a
transpose m = Matrix $ V.fromList $ map (\ n -> column n m) [0..(cols m - 1)]

cols :: Matrix a -> Int
cols (Matrix v) = if V.length v == 0 then 0 else V.length (v V.! 0)

rows :: Matrix a -> Int
rows (Matrix v) = V.length v

column :: Int -> Matrix a -> Vector a
column n (Matrix v) = fmap (V.! n) v

row :: Int -> Matrix a -> Vector a
row n (Matrix v) = v V.! n

shape :: Matrix a -> (Int, Int)
shape m = (rows m, cols m)

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape (m, n) = fromList . chunksOf n . V.toList . flatten
