class Fixnum
  VERSION = 1

  @@values = {
    "M" => 1000, "CM" => 900, "D" => 500, "CD" => 400,
    "C" => 100, "XC" => 90, "L" => 50, "XL" => 40,
    "X" => 10, "IX" => 9, "V" => 5, "IV" => 4,
    "I" => 1
  }.freeze

  def to_roman
    rem = self
    @@values.map do |repr, value|
      quot, rem = rem / value, rem % value
      repr * quot
    end.join
  end
end
