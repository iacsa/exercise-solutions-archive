module ETL where
import qualified Data.Map as M
import Data.Char (toLower)
import Data.List (foldl')

transform :: M.Map a [Char] -> M.Map Char a
transform = foldl' insert M.empty . M.toList
  where
    insert :: M.Map Char a -> (a, [Char]) -> M.Map Char a
    insert mmap (v, ks) = foldl' (\m k -> M.insert (toLower k) v m) mmap ks
