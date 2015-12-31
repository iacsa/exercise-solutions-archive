module Queens (boardString, canAttack) where

type Square = (Int, Int)

boardString :: Maybe Square -> Maybe Square -> String
boardString whiteQueen blackQueen = unlines $ map (unwords . squares) [0..7]
  where
    squares row = map (\ col -> symbol $ Just (row, col)) [0..7]
    symbol square
      | square == whiteQueen = "W"
      | square == blackQueen = "B"
      | otherwise = "_"

canAttack :: Square -> Square -> Bool
canAttack (x1, y1) (x2, y2) =
  x1 == x2 || y1 == y2 || abs (x1 - x2) == abs (y1 - y2)
