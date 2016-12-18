module BookKeeping
  VERSION = 5
end

require 'time'

class Gigasecond
  VERSION = 1
  def Gigasecond.from(date)
    date + 10**9
  end
end
