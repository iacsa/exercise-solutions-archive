open Core.Std

module type ITEM = sig
  type t
  val compare: t -> t -> int
  val equal: t -> t -> bool
  val to_string: t -> string
end

module Make(T: ITEM) = struct
  type t = T.t list

  let empty : t = []

  let equal : t -> t -> bool = (=)

  let to_string (set: t) : string =
    "{" ^ String.concat ~sep:" " (List.map ~f:T.to_string set) ^ "}"

  let rec compare (set1: t) (set2: t) : int = match set1, set2 with
  | [], [] -> 0
  | [], _ -> -1
  | _, [] -> 1
  | hd1 :: tl1, hd2 :: tl2 -> match T.compare hd1 hd2 with
    | 0 -> compare tl1 tl2
    | i -> i

  let rec add (set: t) (item: T.t) : t = match set with
  | [] -> [item]
  | x :: xs -> match T.compare item x with
    | n when n < 0 -> item :: set
    | 0 -> set
    | _ -> x :: add xs item
    
  let of_list : T.t list -> t =
    List.fold ~init:empty ~f:add

  let to_list : t -> T.t list = Fn.id

  let union (set1: t) (set2: t) : t =
    List.fold ~init:set1 ~f:add set2

  let rec remove (set: t) (item: T.t) : t = match set with
  | [] -> []
  | x :: xs -> match T.compare item x with
    | n when n > 0 -> x :: remove xs item
    | 0 -> xs
    | _ -> set

  let difference (set1: t) (set2: t) : t =
    List.fold ~init:set1 ~f:remove set2

  let intersect (set1: t) (set2: t) : t =
    set2 |> difference set1
         |> difference set1

end
