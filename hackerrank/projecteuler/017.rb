# Based on exercism/say

class Say 
  @@ones = [nil, "One", "Two", "Three", "Four",
            "Five", "Six", "Seven", "Eight", "Nine",
            "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen",
            "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
  @@tens = [nil, nil, "Twenty", "Thirty", "Forty", "Fifty",
            "Sixty", "Seventy", "Eighty", "Ninety"]
  @@exps = [nil, nil, "Hundred", "Thousand", nil, nil, "Million",
            nil, nil, "Billion", nil, nil, "Trillion", nil, nil, "Quadrillion"]
  def initialize(val)
    @val = val
    raise ArgumentError if @val < 0 || 10**18 <= @val
  end 
  def in_english
    if @val == 0
      "Zero"
    else
      15.step(0, -3).map do |i|
        num = hundreds((@val / 10**i) % 10**3)
        num.size > 0 ? "#{num}#{i > 0 ? " " : ""}#{@@exps[i]}" : nil 
      end.reject(&:nil?).join(" ")
    end 
  end 
  def hundreds(n) 
    h, t, o = n / 100, (n % 100) / 10, n % 10
    res = (h >= 1 ? ["#{@@ones[h]} Hundred"] : []) 
    if t < 2 
      res << @@ones[t * 10 + o]
    elsif o == 0
      res << @@tens[t]
    else
      res << "#{@@tens[t]} #{@@ones[o]}"
    end 
    res.reject(&:nil?).join(" ")
  end 
end

input_count = gets.to_i

input_count.times do
  n = gets.to_i

  puts Say.new(n).in_english
end
