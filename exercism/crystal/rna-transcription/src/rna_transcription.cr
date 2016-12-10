module RnaComplement
  def self.of_dna(dna)
    dna.chars.map do |c|
      case c
      when 'C'
        'G'
      when 'G'
        'C'
      when 'T'
        'A'
      when 'A'
        'U'
      else
        raise ArgumentError.new("Illegal characters in dna sequence.")
      end
    end.join
  end
end
