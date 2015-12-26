open Core.Std

type dna = [ `A | `C | `G | `T ]
type rna = [ `A | `C | `G | `U ]

let to_rna : dna list -> rna list =
  let f = function
    | `A -> `U
    | `T -> `A
    | `C -> `G
    | `G -> `C
  in
  List.map ~f
