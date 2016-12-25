module Leap exposing (isLeapYear)

divides : Int -> Int -> Bool
divides n m =
  m % n == 0

isLeapYear : Int -> Bool
isLeapYear year =
  divides 4 year && not (divides 100 year) || divides 400 year
