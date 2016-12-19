module Squares (sumOfSquares, squareOfSums, difference) where

powerSum :: Integral a => a -> a -> a -> a
powerSum a b n = (^a) $ sum $ map (^b) [1..n]

sumOfSquares :: Integral a => a -> a
sumOfSquares = powerSum 1 2

squareOfSums :: Integral a => a -> a
squareOfSums = powerSum 2 1

difference :: Integral a => a -> a
difference n = squareOfSums n - sumOfSquares n
