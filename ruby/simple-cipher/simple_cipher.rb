class Cipher
  VERSION = 1
  attr_reader :key
  def initialize(key = nil)
    raise ArgumentError if key and not /^[a-z]+$/ =~ key 
    @key = key || Array.new(100){|i| rand(26) + "a".ord}.map(&:chr).join
  end
  def encode(text)
    text.chars.zip(@key.chars.cycle).map do |v, k|
      ((v.ord + k.ord - 2 * "a".ord) % 26 + "a".ord).chr
    end.join
  end
  def decode(text)
    text.chars.zip(@key.chars.cycle).map do |v, k|
      ((v.ord - k.ord) % 26 + "a".ord).chr
    end.join
  end
end
