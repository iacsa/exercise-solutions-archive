module SumOfMultiples where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples xs n = sum (filter isMultiple [1 .. n - 1])
  where
    isMultiple m = any (divides m) xs
    divides m = (0 ==) . (mod m)

sumOfMultiplesDefault :: Integer -> Integer
sumOfMultiplesDefault = sumOfMultiples [3, 5]
