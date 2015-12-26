module Luhn (checkDigit, addends, checksum, isValid, create) where

digits :: Integral a => a -> [a]
digits 0 = []
digits n = mod n 10 : digits (div n 10)

addends :: Integral a => a -> [a]
addends = reverse . zipWith multiplyDigit (cycle [1, 2]) . digits
  where multiplyDigit i d = d * i - 9 * div (d * i) 10

checksum :: Integral a => a -> a
checksum = checkDigit . sum . addends

checkDigit :: Integral a => a -> a
checkDigit = (`mod` 10)

isValid :: Integral a => a -> Bool
isValid = (0 ==) . checksum

create :: Integral a => a -> a
create n = head $ filter isValid $ [10 * n + k | k <- [0 .. 9]]
