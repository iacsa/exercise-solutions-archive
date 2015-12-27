def to_rna(strain):
  mapping = {"G": "C", "C": "G", "A": "U", "T": "A"}
  return "".join(map(lambda c: mapping.get(c), strain))
