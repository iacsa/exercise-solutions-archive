class SecretHandshake
  attr_reader :commands

  Signs = ["wink", "double blink", "close your eyes", "jump"]

  def initialize(n)
    n = n.to_i
    @commands = Signs.select.with_index{|s, i| (n >> i).odd? }
    @commands.reverse! if (n >> 4).odd?
  end
end
