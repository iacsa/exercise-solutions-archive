class BookKeeping
  VERSION = 2
end

class Pangram
  def self.is_pangram?(string)
    string = string.downcase
    ('a' .. 'z').map do |c|
      string.include?(c)
    end.all?
  end
end
