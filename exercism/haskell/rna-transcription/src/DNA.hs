module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA = sequence . map convert
  where
    convert 'C' = Just 'G'
    convert 'G' = Just 'C'
    convert 'A' = Just 'U'
    convert 'T' = Just 'A'
    convert  _  = Nothing
