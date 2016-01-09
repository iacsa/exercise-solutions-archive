open Core.Std

let count (dna: string) (nucleo: char) : int =
  dna |> String.to_list
      |> List.count ~f:((=) nucleo)

let increment_map (map: int Char.Map.t) (key: char) : int Char.Map.t =
  Char.Map.change map key (fun x -> Some (Option.value x ~default:0 + 1))

let nucleotide_counts (dna: string) : int Char.Map.t =
  String.fold dna ~init:Char.Map.empty ~f:increment_map
