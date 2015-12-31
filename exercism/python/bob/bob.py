def hey(what):
  what = what.strip()
  if what.upper() == what and what.lower() != what:
    return "Whoa, chill out!"
  elif what == "":
    return "Fine. Be that way!"
  elif what[-1] == '?':
    return "Sure."
  else:
    return "Whatever."
