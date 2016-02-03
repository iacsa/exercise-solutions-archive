def hey(what):
  what = what.strip()
  if what.isupper():
    return "Whoa, chill out!"
  elif what == "":
    return "Fine. Be that way!"
  elif what[-1] == '?':
    return "Sure."
  else:
    return "Whatever."
