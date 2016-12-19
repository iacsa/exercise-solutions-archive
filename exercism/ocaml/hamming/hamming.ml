open Core.Std

type nucleotide = A | C | G | T

let rec hamming_distance (ns1: nucleotide list) (ns2: nucleotide list) : int option =
  if List.length ns1 <> List.length ns2
  then None
  else
    ns2 |> List.zip_exn ns1
        |> List.count ~f:(Tuple.T2.uncurry (<>))
        |> Some
