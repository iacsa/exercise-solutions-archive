module ListOps (length, reverse, map, filter, foldr, foldl', (++), concat) where

import Prelude hiding (length, reverse, map, filter, foldr, (++), concat)

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ acc [] = acc
foldl' f acc (x:xs) =
  let acc' = f acc x in
  seq acc' (foldl' f acc' xs)

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr _ acc [] = acc
foldr f acc (x:xs) = f x (foldr f acc xs)

length :: [a] -> Int
length = foldl' (\a x -> a+1) 0 

reverse :: [a] -> [a]
reverse = foldl' (flip (:)) []

map :: (a -> b) -> [a] -> [b]
map f = foldr (\x a -> f x : a) []

filter :: (a -> Bool) -> [a] -> [a]
filter f xs = foldr check [] xs
  where
    check x a
      | f x = x : a
      | otherwise = a

(++) :: [a] -> [a] -> [a]
xs ++ ys = foldr (:) ys xs

concat :: [[a]] -> [a]
concat = foldr (++) []
