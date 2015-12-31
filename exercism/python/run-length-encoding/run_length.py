import re

def encode(message):
  chunks = re.findall("((.)\\2*)", message)
  message = ""
  for chunk, _ in chunks:
    message += (str(len(chunk)) if len(chunk) > 1 else "") + chunk[0]
  return message

def decode(code):
  chunks = re.findall("[0-9]+|.", code)
  message = ""
  while len(chunks) > 0:
    try:
      count = int(chunks[0])
      chunks.pop(0)
    except:
      count = 1
    message += chunks.pop(0) * count
  return message
