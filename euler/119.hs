is_power_sum :: Int -> Bool
is_power_sum n = power_of (digit_sum n) n

digit_sum :: Int -> Int
digit_sum n = sum $ digits n
  where
    digits :: Int -> [Int]
    digits 0 = []
    digits n = mod n 10 : digits (div n 10)

power_of :: Int -> Int -> Bool
power_of 1 n = False
power_of e n = even (e + n) && aux n
  where
    aux :: Int -> Bool
    aux 1 = True
    aux n
      | m == 0 = aux $ d
      | otherwise = False
      where (d, m) = divMod n e

power_sums :: [Int]
power_sums = filter is_power_sum [10 ..]

main :: IO ()
main = mapM_ (putStrLn . show) $ take 30 $ power_sums
