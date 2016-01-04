class Proverb
  def initialize(*ss, qualifier: nil)
    @q = qualifier&. + " "
    @ss = ss
  end

  def to_s
    @ss.each_cons(2).map do |a, b|
      "For want of a #{a} the #{b} was lost.\n"
    end.join + "And all for the want of a #{@q}#{@ss.first}."
  end
end
