class Cipher
  VERSION = 1

  attr_reader :key
  @@char_range = ("a" .. "z").to_a

  def initialize(key = @@char_range.sample(100).join)
    raise ArgumentError unless (/^[a-z]+$/ =~ key)
    @key = key
    @cycle_key = key.each_char.cycle
  end

  def encode(text)
    shift(text, 1)
  end

  def decode(text)
    shift(text, -1)
  end

private

  def shift(text, direction)
    with_key(text).map do |char, key|
      shift_char(char, direction * key)
    end.join
  end

  def shift_char(char, delta)
    @@char_range[(char + delta) % 26]
  end

  def with_key(text)
    text.each_char.zip(@cycle_key).map do |v, k|
      [@@char_range.index(v), @@char_range.index(k)]
    end
  end
end
