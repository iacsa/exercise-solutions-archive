open Core.Std

exception ChainFound

type dominoe = (int * int)


let rec continue_chain
  (dominoes: dominoe array)
  (offset: int)
  (start_with: int)
  (end_with: int) =
    if offset = Array.length dominoes && start_with = end_with then
      raise ChainFound
    else
      (* Try every domino, until one fits and has a further continuation *)
      for i = offset to Array.length dominoes - 1 do
        (* Bring dominoe to the front *)
        Array.swap dominoes offset i;
        (* Turn dominoe if benefitial *)
        let (a, b) = dominoes.(offset) in
        if b = start_with then
          dominoes.(offset) <- (b, a);
        (* Continue recursively *)
        let (c, d) = dominoes.(offset) in
        if c = start_with then
          continue_chain dominoes (offset + 1) d end_with;
        (* Put domino back *)
        Array.swap dominoes offset i
      done


let chain (dominoes: dominoe list) : (dominoe list) option =
  match dominoes with
  | [] ->
      Some []
  | (left, right) :: _ ->
      let dominoe_array = List.to_array dominoes in
      try (continue_chain dominoe_array 1 right left; None) with
      | ChainFound -> Some (Array.to_list dominoe_array)
