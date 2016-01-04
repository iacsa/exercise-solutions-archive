class Clock

  attr_reader :hour, :minute

  def self.at(h, m = 0)
    c = Clock.new(h, m)
  end

  def initialize(h, m)
    @hour = h
    @minute = m
  end

  def to_s
    "%02d:%02d" % [@hour, @minute]
  end

  def +(delta)
    min = @minute + delta
    hour = (@hour +  min / 60) % 24
    Clock.at(hour, min % 60)
  end

  def -(delta)
    self + (-delta)
  end

  def ==(clock)
    @hour == clock.hour && @minute == clock.minute
  end
end
