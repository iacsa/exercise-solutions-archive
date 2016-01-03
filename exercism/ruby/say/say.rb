class Say
  @@ones = [nil, "one", "two", "three", "four",
            "five", "six", "seven", "eight", "nine",
            "ten", "eleven", "twelve", "thirteen", "fourteen",
            "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
  @@tens = [nil, nil, "twenty", "thirty", "forty", "fifty",
            "sixty", "seventy", "eighty", "ninety"]
  @@exps = [nil, nil, "hundred", "thousand", nil, nil, "million",
            nil, nil, "billion", nil, nil, "trillion"]

  def initialize(str)
    @val = str.to_i
    raise ArgumentError if @val < 0 || 10**12 <= @val
  end

  def in_english
    return "zero" if @val == 0

    12.step(0, -3).map do |i|
      num = hundreds((@val / 10**i) % 10**3)
      num.size > 0 ? "#{num}#{i > 0 ? " " : ""}#{@@exps[i]}" : nil
    end.reject(&:nil?).join(" ")
  end

private

  def hundreds(n)
    h, t, o = n / 100, (n % 100) / 10, n % 10
    res = (h >= 1 ? ["#{@@ones[h]} hundred"] : [])
    if t < 2
      res << @@ones[t * 10 + o]
    elsif o == 0
      res << @@tens[t]
    else
      res << "#{@@tens[t]}-#{@@ones[o]}"
    end
    res.reject(&:nil?).join(" ")
  end
end
