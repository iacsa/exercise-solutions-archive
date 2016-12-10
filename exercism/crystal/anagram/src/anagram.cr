module Anagram
  def self.find(word, candidates)
    word = word.downcase
    canon = canonicalize(word)

    candidates.map(&.downcase).select do |other|
      word != other && canon == canonicalize(other)
    end.uniq
  end

  private def self.canonicalize(word)
    word.chars.sort.join
  end
end
