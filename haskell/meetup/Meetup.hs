module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar (fromGregorian, Day, gregorianMonthLength)
import Data.Time.Calendar.WeekDate (toWeekDate)

data Weekday = Monday
             | Tuesday
             | Wednesday
             | Thursday
             | Friday
             | Saturday
             | Sunday
  deriving Enum

data Schedule = First
              | Second
              | Third
              | Fourth
              | Teenth
              | Last

meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
meetupDay schedule weekday year month = case schedule of
  First  -> weekdaysInMonth !! 0
  Second -> weekdaysInMonth !! 1
  Third  -> weekdaysInMonth !! 2
  Fourth -> weekdaysInMonth !! 3
  Teenth -> head (weekdays [13..19])
  Last   -> last weekdaysInMonth
  where
    weekdaysInMonth = weekdays [1..(gregorianMonthLength year month)]
    weekdays = filter (sameWeekday . toWeekDate) . dates
    sameWeekday (_, _, wd) = wd == succ (fromEnum weekday)
    dates = map (fromGregorian year month)
