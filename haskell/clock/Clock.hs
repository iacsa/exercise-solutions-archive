module Clock (fromHourMin, toString) where

import Text.Printf (printf)

data Time = Time Integer Integer
  deriving (Eq, Show)

fromHourMin :: Integer -> Integer -> Time
fromHourMin hour min = Time (mod hour 24) (mod min 60)

toString :: Time -> String
toString (Time hour min) = printf "%02d:%02d" hour min

instance Num Time where
  (+) (Time h1 m1) (Time h2 m2) = fromHourMin hour min
    where
      min = m1 + m2
      hour = h1 + h2 + div (m1 + m2) 60
  (-) time (Time h m) = time + Time (negate h) (negate m)
  negate = (-) (Time 24 00)
  fromInteger n = (Time 0 0) + (Time 0 n)
  (*) = const
  abs = id
  signum = id
