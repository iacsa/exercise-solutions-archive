module BookKeeping
  VERSION = 2
end

class Game

  def initialize
    @half_frames_completed = 0
    @score = 0
    @spare_bonus = 0
    @strike_bonus_1 = 0
    @strike_bonus_2 = 0
    @strike_count = 0
    @strike_bonus = 0
    @bonus_rolls = 0
  end

  def score
    @finished and @score or raise StandardError
  end

  def roll(pins)
    # Set up new pins each frame
    @pins_remaining = 10 if @half_frames_completed.even?

    # Deny further rolls if game is completed
    raise StandardError if @finished

    # Make sure `pins` only holds legal values
    raise StandardError unless pins.integer?
    raise StandardError unless (0 .. @pins_remaining).include?(pins)

    @pins_remaining -= pins

    # Hitting all pins with the first roll of a frame is a strike
    strike = @pins_remaining.zero? && @half_frames_completed.even?

    # Hitting the remaining pins with the second roll is a spare
    spare = !strike && @pins_remaining.zero?

    # A strike completes a full frame, every other roll is only a half
    @half_frames_completed += strike ? 2 : 1

    # Whether rolling a spare or a strike gives the regular bonus
    regular = @half_frames_completed < 20

    # Score increases for every spare and strike scored in the last two rolls
    @score += pins * (1 + @spare_bonus + @strike_bonus_1 + @strike_bonus_2)

    # Carry over strike bonus from last the frame
    @strike_bonus_1 = @strike_bonus_2

    # Mark bonus for two frames if a strike was rolled
    @strike_bonus_2 = strike && regular ? 1 : 0

    # Mark bonus if a spare was rolled
    @spare_bonus = spare && regular ? 1 : 0

    # Grant bonus rolls for a strike or spare in the last frame
    if @half_frames_completed == 20
      @bonus_rolls = 2 if strike
      @bonus_rolls = 1 if spare
    end

    # End the game when all rolls are used up
    if !regular
      @finished = @bonus_rolls == 0
      @bonus_rolls -= 1
    end
  end
end
