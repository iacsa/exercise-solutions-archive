defmodule Robot do
  @type position :: {integer, integer}
  @opaque t :: %__MODULE__{ direction: atom, position: position }
  defstruct direction: nil, position:

  @directions [:north, :east, :south, :west]

  def create(direction, {x, y}) do
    if Enum.member?(@directions, direction) &&
       is_integer(x) &&
       is_integer(y) do
      %__MODULE__{ direction: direction, position: {x, y} }
    else
      raise ArgumentError
    end
  end
  def create(_direction, _position), do: raise ArgumentError

  def position(%__MODULE__{ position: position }), do: position
  def direction(%__MODULE__{ direction: direction }), do: direction
  def turn_left(robot), do: robot |> turn_right |> turn_right |> turn_right
  def turn_right(robot) do
    robot
  end
  def advance(robot) do
    robot
  end
  
end

defmodule RobotSimulator do

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(atom, Robot.position) :: Robot.t
  def create(direction \\ :north, position \\ {0, 0}) do
    Robot.create(direction, position)
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(Robot.t, String.t) :: Robot.t
  def simulate(robot, instructions) do
    instructions
      |> String.to_charlist
      |> Enum.map(&map/1)
      |> Enum.reduce(robot, fn f, acc -> f.(acc) end)
  end

  defp map(instruction) do
    case instruction do
      ?A ->
        &Robot.advance/1
      ?L ->
        &Robot.turn_left/1
      ?R ->
        &Robot.turn_right/1
      _ ->
        raise ArgumentError
    end
  end

  @spec direction(Robot.t) :: atom
  def direction(robot), do: Robot.direction(robot)

  @spec position(Robot.t) :: Robot.position
  def position(robot), do: Robot.position(robot)
end
