module Robot (
  Bearing(..),
  Robot,
  mkRobot,
  coordinates,
  simulate,
  bearing,
  turnRight,
  turnLeft
) where

import Data.List (foldl')

data Bearing = North | East | South | West
  deriving (Eq, Show, Enum)
data Robot = Robot Bearing Position
  deriving (Eq, Show)
type Position = (Integer, Integer)

deltas :: [Position]
deltas = [(0, 1), (1, 0), (0, -1), (-1, 0)]

mkRobot :: Bearing-> Position -> Robot
mkRobot = Robot

bearing :: Robot -> Bearing
bearing (Robot bearing _) = bearing

coordinates :: Robot -> Position
coordinates (Robot _ position) = position

turnRight :: Bearing -> Bearing
turnRight West = North
turnRight bearing = succ bearing

turnLeft :: Bearing -> Bearing
turnLeft = (!! 3) . iterate turnRight

simulate :: Robot -> String -> Robot
simulate = foldl' execute

add :: Position -> Position -> Position
add (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

execute :: Robot -> Char -> Robot
execute (Robot bearing position) instruction = case instruction of
  'L' -> Robot (turnLeft bearing) position
  'R' -> Robot (turnRight bearing) position
  'A' -> Robot bearing (add position (deltas !! fromEnum bearing))
