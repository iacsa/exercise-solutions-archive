open Core.Std
open Tree

type 'a trail = L of 'a t | R of 'a t | T
and 'a t = { focus: 'a Tree.t; trail: 'a trail }
  [@@deriving sexp]

let rec equal veq a b =
  Tree.equal veq a.focus b.focus &&
  match (a.trail, b.trail) with
  | (L z1, L z2) -> equal veq z1 z2
  | (R z1, R z2) -> equal veq z1 z2
  | (T, T) -> true
  | (_, _) -> false

let of_tree (focus: 'a Tree.t) : 'a t = { focus; trail = T }

let value (z: 'a t) : 'a = z.focus.Tree.value

let left (z: 'a t) : 'a t option =
  Option.map z.focus.Tree.left ~f:(fun tree -> { focus = tree; trail = L z })

let right (z: 'a t) : 'a t option =
  Option.map z.focus.Tree.right ~f:(fun tree -> { focus = tree; trail = R z })

let set_left (l: 'a Tree.t option) (z: 'a t) : 'a t =
  { z with focus = { z.focus with left = l } }

let set_right (r: 'a Tree.t option) (z: 'a t) : 'a t =
  { z with focus = { z.focus with right = r } }

let set_value (v: 'a) (z: 'a t) : 'a t =
  { z with focus = { z.focus with value = v } }

let up (z: 'a t) : 'a t option =
  match z.trail with
  | T -> None
  | L father -> Some (set_left (Some z.focus) father)
  | R father -> Some (set_right (Some z.focus) father)

let rec to_tree (z: 'a t) : 'a Tree.t =
  Option.value_map (up z) ~f:to_tree ~default:z.focus
