class Robot
  @@used_names = []
  @@letters = ('A'..'Z').reduce(:+)
  def initialize
    reset
  end
  def name
    @name
  end
  def reset
    @@used_names
    @name = [@@letters[rand(@@letters.size)],
             @@letters[rand(@@letters.size)],
             rand(10),
             rand(10),
             rand(10)].join while @@used_names.member?(@name)
    @@used_names.push(@name)
  end
end
