open Core.Std

type nucleotide = A | C | G | T

let rec hamming_distance (ns1: nucleotide list) (ns2: nucleotide list) : int =
  if List.length ns1 > List.length ns2
  then hamming_distance ns2 ns1
  else
    ns2 |> Fn.flip List.take (List.length ns1)
        |> List.zip_exn ns1
        |> List.count ~f:(Tuple.T2.uncurry (<>))
