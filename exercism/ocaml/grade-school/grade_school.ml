open Core.Std

type school = string list Int.Map.t

(** Create a new empty school *)
let create () : school = Int.Map.empty

(** Add a student to a school *)
let add (name: string) (g: int) (s: school) : school =
  Int.Map.change s g ~f:(fun x -> Some (name :: (Option.value x ~default:[])))

(** Get all the students from a grade *)
let grade (g: int) (s: school) : string list =
  Int.Map.find s g |> Option.value ~default:[]

(** Sort the list of students in a grade, if necessary *)
let sort : school -> school =
  Int.Map.map ~f:(List.sort ~cmp:String.compare)

(** Return the list of grades and students as a map *)
let to_map : school -> string list Int.Map.t = Fn.id
