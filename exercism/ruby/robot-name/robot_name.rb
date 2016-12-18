require 'set'

module BookKeeping
  VERSION = 2
end

class Robot
  @@letters = ('A'..'Z').to_a

  @@taken = Set.new

  def initialize
    reset
  end

  def name
    @name
  end

  def reset
    begin
      @name = @@letters.sample(2).join + "%03d" % rand(1000)
    end until !@@taken.include?(@name)
    @@taken << @name
  end
end
