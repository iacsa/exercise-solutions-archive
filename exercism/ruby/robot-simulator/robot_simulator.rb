class Simulator

  Instructions = {
    "L" => :turn_left,
    "R" => :turn_right,
    "A" => :advance
  }

  def instructions(code)
    code.chars.map do |c|
      Instructions[c]
    end
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, code)
    instructions(code).each do |instruction|
      robot.send(instruction)
    end
  end
end

class Robot
  attr_reader :bearing, :coordinates

  Directions = {
    :east  => [[ 1,  0], :south],
    :west  => [[-1,  0], :north],
    :north => [[ 0,  1], :east],
    :south => [[ 0, -1], :west]
  }

  def orient(bearing)
    raise ArgumentError if Directions[bearing].nil?
    @bearing = bearing
  end

  def turn_right
    @bearing = Directions[@bearing].last
  end

  def turn_left
    3.times do turn_right end
  end

  def at(*coordinates)
    @coordinates = coordinates
  end

  def advance
    dx = Directions[@bearing].first.dup
    @coordinates.map!{|x| x + dx.shift }
  end
end
