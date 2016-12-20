open Core.Std

type nucleotide = A | C | G | T

let hamming_distance (ns1: nucleotide list) (ns2: nucleotide list) : int option =
  List.zip ns1 ns2
  |> Option.map ~f:(List.count ~f:(Tuple.T2.uncurry (<>)))
