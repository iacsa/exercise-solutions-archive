module BookKeeping
  VERSION = 3
end

module Binary

  def self.to_decimal(str)
    str.chars.reduce(0) do |acc, d|
      raise ArgumentError if "01".index(d).nil?
      2 * acc + d.to_i
    end
  end
end
