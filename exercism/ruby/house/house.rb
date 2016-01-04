class House

  @@pieces = [
    ["malt", "lay in"],
    ["rat", "ate"],
    ["cat", "killed"],
    ["dog", "worried"],
    ["cow with the crumpled horn", "tossed"],
    ["maiden all forlorn", "milked"],
    ["man all tattered and torn", "kissed"],
    ["priest all shaven and shorn", "married"],
    ["rooster that crowed in the morn", "woke"],
    ["farmer sowing his corn", "kept"],
    ["horse and the hound and the horn", "belonged to"],
    nil, # Needs to be here for the loop to work as intended
  ]

  def self.recite
    lines = ""
    verses = []

    @@pieces.each do |actor, verb|
      verses << "This is the #{lines}house that Jack built.\n"
      
      lines = "#{actor}\nthat #{verb} the " + lines
    end

    verses.join("\n")
  end
end
