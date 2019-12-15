(* General outline of finding the farthest neighbors for each node:
*
* This is an exercise about longest distances in a tree. We use the property
* that a tree has a center node, that all longest paths go through.
*
# 1. Find the "center" node of the graph # # 2. All longest paths go through
the center, so for node e1 the find . -name #    '*~' -delete  farthest
neighbors N(e1) must also be of maximum distance from #    the center. Unless
:q *)

  (*
let rec print_neighbors = function | [] -> print_newline () | n :: ns ->
  print_int (n + 1); print_string ", "; print_neighbors ns
  *)

(*
let () = for i = 1 to number_of_cities do
  print_int i;
  print_string ": ";
  print_neighbors (Array.get cities (i - 1)).neighbors
done
*)

type node = { id: int; mutable neighbors: int list }

let read_int_tuple () = begin
  let line = String.trim (read_line ()) in
  let space = String.index line ' ' in
  let n1 = int_of_string (String.sub line 0 space)
  and n2 = int_of_string (String.sub line (space + 1) (String.length line - space - 1))
  in
  (n1, n2)
end

let rec build_graph cities = function
  | 0 -> ()
  | n -> let (city1, city2) = read_int_tuple () in begin
    let node = Array.get cities (city1 - 1) in node.neighbors <- (city2 - 1) :: node.neighbors;
    let node = Array.get cities (city2 - 1) in node.neighbors <- (city1 - 1) :: node.neighbors;
    build_graph cities (n - 1)
  end

let (number_of_cities, number_of_trips) = read_int_tuple ()
let () = print_endline (string_of_int number_of_cities)
let () = print_endline (string_of_int number_of_trips)

let cities = Array.init number_of_cities (fun i -> { id = i + 1; neighbors = [] })
let () = build_graph cities (number_of_cities - 1)

(* Find center node of the graph. If there are two centers, either one is fine. *)
