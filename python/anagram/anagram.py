def is_anagram(w1, w2):
  l1, l2 = w1.lower(), w2.lower()
  return l1 != l2 and "".join(sorted(l1)) == "".join(sorted(l2))

def detect_anagrams(word, candidates):
  return [w for w in candidates if is_anagram(word, w)]
