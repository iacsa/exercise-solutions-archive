class BookKeeping
  VERSION = 3
end

class Pangram
  def self.pangram?(string)
    ('a' .. 'z').all?(&(string.downcase.method("include?")))
  end
end
