class Robot
  @@used_names = []
  @@letters = (('a'..'z').to_a + ('A'..'Z').to_a).reduce(:+)
  def initialize
    reset
  end
  def name
    @name
  end
  def reset
    @@used_names
    @name = [@@letters[rand(52)],
             @@letters[rand(52)],
             rand(10),
             rand(10),
             rand(10)].join while @@used_names.member?(@name)
    @@used_names.push(@name)
  end
end
