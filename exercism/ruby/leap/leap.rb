module BookKeeping
  VERSION = 2
end

class Year
  def Year.leap?(n)
     (n % 400).zero? || (n % 4).zero? && (n % 100).positive?
  end
end
