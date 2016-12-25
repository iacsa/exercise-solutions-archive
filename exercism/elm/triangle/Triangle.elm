module Triangle exposing (Triangle (..), triangleKind)


version : Int
version =
    2


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


triangleKind : Float -> Float -> Float -> Result String Triangle
triangleKind a b c =
  if List.any (\x -> x <= 0) [a, b, c] then
    Err "Invalid lengths"
  else if a > b + c || b > a + c || c > a + b then
    Err "Violates inequality"
  else if a == b && b == c then
    Ok Equilateral
  else if a == b || b == c || c == a then
    Ok Isosceles
  else
    Ok Scalene
