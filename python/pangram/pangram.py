def is_pangram(string: str) -> bool:
  found = [False] * 26
  for c in string.lower():
    idx = ord(c) - ord("a")
    if 0 <= idx < 26:
      found[idx] = True
  return all(found)
