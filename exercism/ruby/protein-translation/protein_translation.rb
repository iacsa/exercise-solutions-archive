class InvalidCodonError < Exception
end

class Translation
  def self.of_codon codon
    case codon
    when "AUG"
      "Methionine"
    when "UUU", "UUC"
      "Phenylalanine"
    when "UUA", "UUG"
      "Leucine"
    when "UCU", "UCC", "UCA", "UCG"
      "Serine"
    when "UAU", "UAC"
      "Tyrosine"
    when "UGU", "UGC"
      "Cysteine"
    when "UGG"
      "Tryptophan"
    when "UAA", "UAG", "UGA"
      "STOP"
    else
      raise InvalidCodonError
    end
  end
  
  def self.of_rna (strain)
    strain.chars.each_slice(3).map do |codon|
      of_codon(codon.join)
    end.take_while{|protein| protein != "STOP"}
  end
end
