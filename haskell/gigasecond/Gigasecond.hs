module Gigasecond where
import Data.Time.Calendar (addDays, Day)

gigasecondInDays :: Integer
gigasecondInDays = floor (1e9 / 60 / 60 / 24)

fromDay :: Day -> Day
fromDay = addDays gigasecondInDays
