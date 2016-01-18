module DNA (hammingDistance) where

hammingDistance :: String -> String -> Int
hammingDistance as bs = countTrue charsDiffer
  where
    charsDiffer = zipWith (/=) as bs
    countTrue = length . filter id
