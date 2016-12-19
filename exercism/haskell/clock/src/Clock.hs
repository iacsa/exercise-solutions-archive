module Clock (fromHourMin, toString) where

import Text.Printf (printf)

data Time = Time Integer Integer
  deriving (Eq, Show)

fromHourMin :: Integer -> Integer -> Time
fromHourMin hour min = fromInteger (60 * hour + min)

toString :: Time -> String
toString (Time hour min) = printf "%02d:%02d" hour min

instance Num Time where
  (+) (Time h1 m1) (Time h2 m2) = fromHourMin (h1 + h2) (m1 + m2)
  (-) (Time h1 m1) (Time h2 m2) = fromHourMin (h1 - h2) (m1 - m2)
  negate = (-) (Time 24 00)
  fromInteger n = Time (mod (div n 60) 24) (mod n 60)
  (*) = const
  abs = id
  signum = id
