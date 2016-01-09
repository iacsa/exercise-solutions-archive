class Person
  attr_reader :age

  def initialize(initial_age)
    puts "This person is not valid, setting age to 0." if initial_age < 0
    @age = [initial_age, 0].max
  end

  def amIOld
    category = case @age
               when 0 .. 12 then "young"
               when 13 .. 17 then "a teenager"
               else "old"
               end
    puts "You are #{category}."
  end

  def yearPasses
    @age += 1
  end
end
