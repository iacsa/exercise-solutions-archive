module BookKeeping
  VERSION = 2
end

class Series
  def initialize(number_string)
    raise ArgumentError if /[^0-9]/ =~ number_string
    @nums = number_string.chars.map(&:to_i)
  end
  def largest_product(size)
    raise ArgumentError if size > @nums.size
    return 1 if size == 0
    @nums.each_cons(size).map{ |sequence| sequence.reduce(:*) }.max
  end
end
