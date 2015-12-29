class FoodChain
  VERSION = 2

  SPECIAL = [
    "",
    "It wriggled and jiggled and tickled inside her.\n",
    "How absurd to swallow a bird!\n",
    "Imagine that, to swallow a cat!\n",
    "What a hog, to swallow a dog!\n",
    "Just opened her throat and swallowed a goat!\n",
    "I don't know how she swallowed a cow!\n",
    "She's dead, of course!\n"
  ]
  NAME1 = ["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"]
  NAME2 = ["fly", "spider that wriggled and jiggled and tickled inside her",
           "bird", "cat", "dog", "goat", "cow", "horse"]
  ENDING = "I don't know why she swallowed the fly. Perhaps she'll die."

  def self.song
    verses(1, 8)
  end
  def self.verses(n, m)
    (n .. m).map{|i| verse(i) }.join("\n\n")
  end
  def self.verse(n)
    text = "I know an old lady who swallowed a #{NAME1[n-1]}.\n#{SPECIAL[n-1]}"
    if n < 8
      text += (n - 1).downto(1).map do |k|
        "She swallowed the #{NAME1[k]} to catch the #{NAME2[k-1]}.\n"
      end.join + ENDING
    end
    text
  end
end
