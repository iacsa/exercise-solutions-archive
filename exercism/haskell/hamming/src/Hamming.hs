module DNA (hammingDistance) where

hammingDistance :: String -> String -> Integer
hammingDistance s1 s2 = sum [1 | (c1, c2) <- zip s1 s2, c1 /= c2]
