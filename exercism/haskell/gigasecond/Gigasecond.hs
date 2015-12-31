module Gigasecond where
import Data.Time.Clock (UTCTime, addUTCTime)

fromDay :: UTCTime -> UTCTime
fromDay = addUTCTime 1e9
