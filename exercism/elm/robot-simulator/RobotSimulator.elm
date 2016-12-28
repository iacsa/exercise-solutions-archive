module RobotSimulator
  exposing ( Bearing (..)
           , Robot
           , defaultRobot
           , turnRight
           , turnLeft
           , advance
           , simulate
           )


type Bearing
    = North
    | East
    | South
    | West


type alias Coordinates =
          { x: Int
          , y: Int
          }


type alias Robot =
          { bearing: Bearing
          , coordinates: Coordinates
          }


defaultRobot : Robot
defaultRobot =
  Robot North { x = 0, y = 0 }


turnRight : Robot -> Robot
turnRight robot =
  let
    newBearing =
      case robot.bearing of
        North ->
          East
        East ->
          South
        South ->
          West
        West ->
          North
  in
    { robot | bearing = newBearing }


turnLeft : Robot -> Robot
turnLeft =
  turnRight >> turnRight >> turnRight


advance : Robot -> Robot
advance robot =
  { robot | coordinates = add robot.coordinates (delta robot.bearing) }


simulate : String -> Robot -> Robot
simulate program robot =
  program
    |> String.toList
    |> List.foldl interpret robot


delta : Bearing -> Coordinates
delta bearing =
  case bearing of
    North ->
      { x = 0, y = 1 }
    East ->
      { x = 1, y = 0 }
    South ->
      { x = 0, y = -1 }
    West ->
      { x = -1, y = 0 }


add : Coordinates -> Coordinates -> Coordinates
add p q =
  { x = p.x + q.x, y = p.y + q.y }


interpret : Char -> Robot -> Robot
interpret char =
  case char of
    'L' ->
      turnLeft
    'R' ->
      turnRight
    'A' ->
      advance
    _ ->
      identity
