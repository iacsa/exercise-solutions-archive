module DNA where

toRNA :: String -> String
toRNA = map convert
  where
  convert 'C' = 'G'
  convert 'G' = 'C'
  convert 'A' = 'U'
  convert 'T' = 'A'
  convert  x  = error $ "Invalid Character in DNA String: " ++ show x
