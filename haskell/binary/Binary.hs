module Binary (toDecimal) where

toDecimal :: [Char] -> Integer
toDecimal binary = aux binary 0
  where
    aux [] acc = acc
    aux ('0' : binary) acc = aux binary (2 * acc)
    aux ('1' : binary) acc = aux binary (2 * acc + 1)
    aux _ _ = 0
