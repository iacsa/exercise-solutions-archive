class WordProblem
  attr_reader :answer
  OPS = {
    "plus" => :+,
    "minus" => :-,
    "multiplied by" => :*,
    "divided by" => :/
  }
  Reducable = Regexp.new("(-?\\d+) (#{OPS.keys.join("|")}) (-?\\d+)(.*)")

  def initialize (query)
    @query = query.dup
    while match = Reducable.match(@query)
      @query = match[1].to_i.send(OPS[match[2]], match[3].to_i).to_s + match[4]
    end
    if match = /(-?\d+)\?/.match(@query)
      @answer = match[1].to_i
    else
      raise ArgumentError.new("Malformed Query!")
    end
  end
end
