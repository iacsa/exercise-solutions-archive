module BookKeeping
  VERSION = 2
end

class Clock

  attr_reader :hour, :minute

  def self.at(h, m = 0)
    min = m % 60
    hour = (h +  m / 60) % 24
    c = Clock.new(hour, min)
  end

  def initialize(h, m)
    @hour = h
    @minute = m
  end

  def to_s
    "%02d:%02d" % [@hour, @minute]
  end

  def +(delta)
    Clock.at(@hour, @minute + delta)
  end

  def -(delta)
    self + (-delta)
  end

  def ==(clock)
    @hour == clock.hour && @minute == clock.minute
  end
end
