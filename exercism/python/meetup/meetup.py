from datetime import date, timedelta
from calendar import monthrange

weekday_table = {
  "Monday": 0,
  "Tuesday": 1,
  "Wednesday": 2,
  "Thursday": 3,
  "Friday": 4,
  "Saturday": 5,
  "Sunday": 6,
}

def meetup_day(year, month, weekday, label):
  def find_weekday(start, direction):
    day = date(year, month, start)
    while day.weekday() != weekday_table[weekday]:
      day += timedelta(direction)
    return day
  days_in_month = monthrange(year, month)[1]
  firstday = find_weekday(1, 1)
  lastday = find_weekday(days_in_month, -1)
  if label == "1st":
    return firstday
  elif label == "2nd":
    return firstday + timedelta(7)
  elif label == "3rd":
    return firstday + timedelta(14)
  elif label == "4th":
    return firstday + timedelta(21)
  elif label == "5th":
    if lastday - firstday != timedelta(28): raise ValueError
    return lastday
  elif label == "last":
    return lastday
  elif label == "teenth":
    return find_weekday(13, 1)
  else:
    raise ValueError
