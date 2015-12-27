def word_count(string):
  counts = {}
  for word in filter(lambda w: w != "", splits(string)):
    counts[word] = 1 + counts.get(word, 0)
  return counts

def splits(string):
  word = ""
  for c in string.lower():
    if c.isalnum():
      word = word + c
    else:
      yield word
      word = ""
  yield word
