module LeapYear (isLeapYear) where

divisibleBy :: Integer -> Integer -> Bool
divisibleBy x y = mod x y == 0

isLeapYear :: Integer -> Bool
isLeapYear year =
  year `divisibleBy` 400 || year `divisibleBy` 4 && not (year `divisibleBy` 100)
