module Binary
  def self.to_decimal(n)
    raise ArgumentError.new("Not a binary number.") unless /\A[01]+\Z/ =~ n
    n.chars.reduce(0) do |result, digit|
      result * 2 + digit.to_i
    end
  end
end
