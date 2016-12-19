open Core.Std

let is_silence query = String.strip query = ""
let is_question query = String.is_suffix (String.strip query) ~suffix:"?"
let is_shout query = (String.uppercase query  = query) &&
                     (String.lowercase query <> query)

let response_for = function
  | query when is_silence query  -> "Fine. Be that way!"
  | query when is_shout query    -> "Whoa, chill out!"
  | query when is_question query -> "Sure."
  | _ -> "Whatever."
