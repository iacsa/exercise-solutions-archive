module House (rhyme) where

text :: [(String, String)]
text = [("malt", "lay in"),
        ("rat", "ate"),
        ("cat", "killed"),
        ("dog", "worried"),
        ("cow with the crumpled horn", "tossed"),
        ("maiden all forlorn", "milked"),
        ("man all tattered and torn", "kissed"),
        ("priest all shaven and shorn", "married"),
        ("rooster that crowed in the morn", "woke"),
        ("farmer sowing his corn", "kept"),
        ("horse and the hound and the horn", "belonged to")]

rhyme :: String
rhyme = unlines $ map complete $ scanl add "" text
  where
    add acc (actor, verb) = actor ++ "\nthat " ++ verb ++ " the " ++ acc
    complete s = "This is the " ++ s ++ "house that Jack built.\n"
