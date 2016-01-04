class PigLatin

  def self.translate(text)
    text.split.map{|word| translate_word(word) }.join(" ")
  end

private

  def self.translate_word(word)
    index = case
    when /^([bcdfghlklmnpqrstvwxyz]qu|thr|sch)/ =~ word then 3
    when /^(ch|qu|th)/ =~ word then 2
    when /^(ye|[bcdfghlklmnpqrstvwz]|[xy][aeiou])/ =~ word then 1
    else 0
    end
    word.chars.rotate(index).join + "ay"
  end
end
