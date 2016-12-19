module Phone where
import Data.Char (isDigit)

number :: String -> Maybe String
number s
  | length num == 10 = Just num
  | length num == 11 && head num == '1' = Just $ tail num
  | otherwise = Nothing
  where
    num = filter isDigit s
      
areaCode :: String -> Maybe String
areaCode = fmap (take 3) . number

prettyPrint :: String -> Maybe String
prettyPrint = fmap pp . number

pp :: String -> String
pp num = "(" ++ area ++ ") " ++ first ++ "-" ++ second
  where
    area = take 3 num
    (first, second) = splitAt 3 (snd $ splitAt 3 num)
