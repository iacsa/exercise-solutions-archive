module Gigasecond
  private GIGASECOND = Time::Span.new(hours = 0,
                                      minutes = 0,
                                      seconds = 1_000_000_000)
  def self.from(time)
    time + GIGASECOND
  end
end
