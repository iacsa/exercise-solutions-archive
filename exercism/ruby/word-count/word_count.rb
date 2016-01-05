class Phrase
  VERSION = 1

  attr_reader :word_count

  def initialize(line)
    @word_count = Hash.new{|h, k| h[k] = 0 }

    # Differentiate single quotes and apostrophes
    line.downcase.split(/'?[^[:alnum:]']'?/).each do |word|
      @word_count[word] += 1 unless word.empty?
    end
  end
end
