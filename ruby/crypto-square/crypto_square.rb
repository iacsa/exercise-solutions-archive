class Crypto
  attr_reader :normalize_plaintext, :size
  def initialize(str)
    @normalize_plaintext = str.gsub(/[^a-zA-Z0-9]/, "").downcase
    n = @normalize_plaintext.size
    @size = Math.sqrt(n).ceil

    # We want this padded to rectangular size for #transpose to work later
    m = (n.to_f / size).ceil * size
    @char_segments = @normalize_plaintext.chars.fill(nil, n ... m).each_slice(size)
  end
  def plaintext_segments
    @char_segments.map(&:join)
  end
  def ciphertext
    normalize_ciphertext("")
  end
  def normalize_ciphertext(delim = " ")
    @char_segments.to_a.transpose.map(&:join).join(delim)
  end
end
