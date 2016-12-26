module RNATranscription
  exposing ( toRNA
           )


toRNA : String -> Result Char String
toRNA dna =
  let
    translateChar char =
      case char of
        'A' ->
          Ok 'U'
        'C' ->
          Ok 'G'
        'G' ->
          Ok 'C'
        'T' ->
          Ok 'A'
        _ ->
          Err char
    translate =
      translateChar >> Result.map2 String.cons
  in
    dna
      |> String.foldl translate (Ok "")
      |> Result.map String.reverse
