class Phrase
  VERSION = 1
  attr_reader :word_count
  def initialize (line)
    @word_count =
      line.downcase
          .split(/'?[^[:alnum:]']'?/) # Differentiate singe quotes and apostrophes
          .select{|w| w.size > 0 }
          .inject({}){|d, w| d[w] = (d[w] || 0) + 1; d }
  end
end
