class Robot
  @@letters = ('A'..'Z').to_a
  def initialize
    reset
  end
  def name
    @name
  end
  def reset
    @name = @@letters.sample(2).join + "%03d" % rand(1000)
  end
end
