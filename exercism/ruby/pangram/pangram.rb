class BookKeeping
  VERSION = 2
end

class Pangram
  def self.is_pangram?(string)
    ('a' .. 'z').all?(&(string.downcase.method("include?")))
  end
end
