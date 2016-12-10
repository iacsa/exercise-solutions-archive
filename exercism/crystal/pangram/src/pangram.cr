module Pangram
  def self.pangram?(string)
    string = string.downcase
    ('a' .. 'z').all?{|c| string.includes?(c)}
  end
end
