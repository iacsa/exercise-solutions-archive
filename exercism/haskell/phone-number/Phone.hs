module Phone where
import Data.Char (isDigit)

number :: String -> String
number s
  | length num == 10 = num
  | length num == 11 && head num == '1' = tail num
  | otherwise = "0000000000"
  where
    num = filter isDigit s
      
areaCode :: String -> String
areaCode = take 3

prettyPrint :: String -> String
prettyPrint s =
  "(" ++ area ++ ") " ++ first ++ "-" ++ second
  where
    num = number s
    area = areaCode num
    (first, second) = splitAt 3 (snd $ splitAt 3 num)
