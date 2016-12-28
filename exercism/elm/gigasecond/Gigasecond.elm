module Gigasecond
  exposing ( add
           )

import Date
import Time


add : Date.Date -> Date.Date
add =
  Date.toTime
    >> (+) (10 ^ 9 * Time.second)
    >> Date.fromTime
