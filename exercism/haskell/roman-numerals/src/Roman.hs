module Roman (numerals) where

digits :: [(String, Int)]
digits = [("M", 1000), ("CM", 900), ("D", 500), ("CD", 400),
          ("C", 100), ("XC", 90), ("L", 50), ("XL", 40),
          ("X", 10), ("IX", 9), ("V", 5), ("IV", 4), ("I", 1) ]

numerals :: Int -> Maybe String
numerals = Just . (num digits "")
  where
    num _ str 0 = str
    num ((digit, value) : digits) str n
      | n >= value = num ((digit, value) : digits) (str ++ digit) (n - value)
      | otherwise = num digits str n
    num _ _ _ = error "numerals: Unreachable pattern."
