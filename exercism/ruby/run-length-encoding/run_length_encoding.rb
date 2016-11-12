class BookKeeping
  VERSION = 2
end

class RunLengthEncoding
  def self.encode(string)
    string.scan(/((.)\2*)/).map do |a, b|
      "#{a.size if a.size > 1}#{b}"
    end.join
  end
  def self.decode(string)
    string.scan(/(\d*)(.)/).map do |count, char|
      char * [count.to_i, 1].max
    end.join
  end
end
