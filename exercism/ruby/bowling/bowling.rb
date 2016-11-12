module BookKeeping
  VERSION = 2
end

class Game

  def initialize
    @state = :first
    @last = 0
    @score = 0
    @count = 0
  end

  def score
    raise StandardError unless @state == :finished
    @score
  end

  def roll(pins)
    raise StandardError unless pins.integer?
    raise StandardError unless (0 .. 10).include?(pins)

    @score += pins
    @count += 1

    case @state
    when :first
      @state = :second
      if pins == 10
        @state = :strike_first
        @count += 1
      end
    when :second
      raise StandardError if pins + @last > 10
      @state = :first
      if pins + @last == 10
        @state = :spare
      end
    when :spare
      @score += pins
      @state = :second
    when :strike_first
      @score += pins
      @state = :strike_second
      if pins == 10
        @count += 1
        @state = :strike_double
      end
    when :strike_second
      raise StandardError if pins + @last > 10
      @score += pins
      @state = :first
      if pins + @last == 10
        @state = :spare
      end
    when :strike_double
      @score += 2 * pins
      @state = :strike_second
      if pins == 10
        @count += 1
        @state = :strike_double
      end
    when :spare_bonus
      @state = :finished
    when :strike_bonus_1
      @state = :strike_bonus_2
    when :strike_bonus_2
      raise StandardError if @last < 10 && pins + @last > 10
      @state = :finished
    when :strike_bonus_strike
      @score += pins
      @state = :strike_bonus_2
    when :finished
      raise StandardError
    end

    if @count == 20
      if @state == :spare
        @state = :spare_bonus
      elsif @state == :strike_first
        @state = :strike_bonus_1
      elsif @state == :strike_double
        @state = :strike_bonus_strike
      else
        @state = :finished
      end
    end

    @last = pins
  end
end
