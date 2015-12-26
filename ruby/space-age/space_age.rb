class SpaceAge
  attr_reader :seconds
  def initialize (seconds)
    @seconds = seconds
  end
  PLANETS = [
    ["earth", 1],
    ["mercury", 0.2408467],
    ["venus", 0.61519726],
    ["mars", 1.8808158],
    ["jupiter", 11.862615],
    ["saturn", 29.447498],
    ["uranus", 84.016846],
    ["neptune", 164.79132]
  ]

  PLANETS.each do |name, factor|
    define_method("on_"+ name) do
      (@seconds / 31557600.0 / factor).round(2)
    end
  end
end
