class Complement
  VERSION = 2

  def Complement.of_dna (rna)
    raise ArgumentError.new("Illegal RNA-string.") if not rna =~ /^[GCTA]*$/
    rna.tr("GCTA", "CGAU")
  end
  def Complement.of_rna (dna)
    raise ArgumentError.new("Illegal DNA-string.") if not dna =~ /^[CGAU]*$/
    dna.tr("CGAU", "GCTA")
  end
end
