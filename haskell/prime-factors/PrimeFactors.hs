module PrimeFactors (primeFactors) where

primeFactors :: Integer -> [Integer]
primeFactors = aux [2..] []
  where
    aux _ acc 1 = reverse acc
    aux (p : ps) acc n
      | 0 == mod n p = aux (p : ps) (p : acc) (div n p)
      | otherwise = aux ps acc n
    aux _ _ _ = error "primeFactors: Unreachable pattern."
