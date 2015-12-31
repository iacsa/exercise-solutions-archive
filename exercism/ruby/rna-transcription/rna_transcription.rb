class Complement
  VERSION = 3

  [
    ["dna", "GCTA"],
    ["rna", "CGAU"]
  ].permutation do |from, to|
    define_singleton_method("of_#{from[0]}") do |strand|
      raise ArgumentError if not strand =~ /^[#{from[1]}]*$/
      strand.tr(from[1], to[1])
    end
  end
end
