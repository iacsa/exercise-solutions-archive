module School (empty, add, sorted, grade, School) where
import Data.IntMap (findWithDefault, toList, insertWith, IntMap)
import qualified Data.IntMap (empty)
import Data.List (sort)

newtype School = School (IntMap [String])

empty :: School
empty = School (Data.IntMap.empty)

add :: Int -> String -> School -> School
add grade name (School school) =
  School $ insertWith (\x y -> sort $ x++y) grade [name] school

sorted :: School -> [(Int, [String])]
sorted (School school) = toList school

grade :: Int -> School -> [String]
grade n (School school) = findWithDefault [] n school
