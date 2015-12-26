class FoodChainSong
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
  ENDING = "I don't know why she swallowed the fly. Perhaps she'll die.\n"
  def sing
    verses(1, 8)
  end
  def verses (n, m)
    (n..m).map{|i| verse(i) + "\n"}.join
  end
  def verse (n)
    text = "I know an old lady who swallowed a #{NAME1[n-1]}.\n" + SPECIAL[n-1]
    text += (n-1).downto(1).map do |k|
      "She swallowed the #{NAME1[k]} to catch the #{NAME2[k-1]}.\n"
    end.join + ENDING if n < 8
    text
  end
end
