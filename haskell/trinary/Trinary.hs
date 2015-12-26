module Trinary (showTri, readTri) where

showTri :: Integral a => a -> String
showTri 0 = ""
showTri n = showTri (div n 3) ++ show (fromIntegral $ mod n 3)

readTri :: Integral a => String -> a
readTri = aux 0
  where
    aux acc "" = acc
    aux acc (c : cs)
      | elem c "012" = aux (3 * acc + (fromInteger $ read [c])) cs
      | otherwise = 0
