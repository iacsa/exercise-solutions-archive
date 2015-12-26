module ETL where
import qualified Data.Map as M
import Data.Char (toLower)
import Data.List (foldl')

transform :: M.Map Int [String] -> M.Map String Int
transform = foldl' insert M.empty . M.toList
  where
    insert :: M.Map String Int -> (Int, [String]) -> M.Map String Int
    insert mmap (v, ks) = foldl' (\m k -> M.insert (map toLower k) v m) mmap ks
