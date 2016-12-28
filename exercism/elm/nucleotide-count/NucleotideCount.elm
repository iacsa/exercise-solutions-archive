module NucleotideCount
  exposing ( version
           , nucleotideCounts
           )

import Dict


version : Int
version =
  2


type alias Counts =
  { a: Int
  , t: Int
  , c: Int
  , g: Int
  }


empty : Counts
empty =
  { a = 0, t = 0, c = 0, g = 0 }


increment : Char -> Counts -> Counts
increment c counts =
  case c of
    'A' ->
      { counts | a = counts.a + 1 }
    'T' ->
      { counts | t = counts.t + 1 }
    'C' ->
      { counts | c = counts.c + 1 }
    'G' ->
      { counts | g = counts.g + 1 }
    _ -> counts


nucleotideCounts : String -> Counts
nucleotideCounts =
  String.foldl increment empty
