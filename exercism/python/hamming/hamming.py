def distance(s1, s2):
  return len([1 for c1, c2 in zip(s1, s2) if c1 != c2])
