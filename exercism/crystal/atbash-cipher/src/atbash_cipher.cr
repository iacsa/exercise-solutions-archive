module Atbash
  def self.encode(text)
    text = text.downcase.gsub(/[^0-9a-z]/, "")

    text.chars.map do |c|
      ('a' .. 'z').includes?(c) ? (219 - c.ord).chr : c
    end.each_slice(5).map(&.join).join(" ")
  end
end
