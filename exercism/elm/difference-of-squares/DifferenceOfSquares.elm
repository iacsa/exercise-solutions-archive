module DifferenceOfSquares
  exposing ( sumOfSquares
           , squareOfSum
           , difference
           )


sumOfSquares : Int -> Int
sumOfSquares upTo =
  let
    n = upTo
  in
    (2 * n + 1) * (n + 1) * n // 6


squareOfSum : Int -> Int
squareOfSum upTo =
  let
    n = upTo
  in
    ((n + 1) * n) ^ 2 // 4 


difference : Int -> Int
difference upTo =
  squareOfSum upTo - sumOfSquares upTo
