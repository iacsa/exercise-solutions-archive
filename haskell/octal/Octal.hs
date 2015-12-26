module Octal (showOct, readOct) where

showOct :: Integral a => a -> String
showOct 0 = ""
showOct n = showOct (div n 8) ++ show (fromIntegral $ mod n 8)

readOct :: Integral a => String -> a
readOct = aux 0
  where
    aux acc "" = acc
    aux acc (c : cs) = aux (8 * acc + (fromInteger $ read [c])) cs
