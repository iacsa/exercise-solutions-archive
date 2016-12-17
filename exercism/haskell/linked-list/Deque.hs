module Deque (mkDeque, push, pop, shift, unshift) where

import Data.Vector (MVector)
import qualified Data.Vector as V
import Data.List.Split (chunksOf)

newtype Deque = Deque (MVector Char)

mkDeque :: IO Deque
mkDeque = return $ Deque empty

push :: Deque -> Char -> IO ()
push (Deque dq) vec = modifyMVar_ dq (\a -> return $ val : a)

unshift :: Deque -> Char -> IO ()
unshift (Deque dq) val = modifyMVar_ dq (\a -> return $ val : a)

pop :: Deque -> IO (Maybe Char)
pop (Deque dq) = do
  list <- readMVar dq
  case list of
    [] -> return Nothing
    x : rest ->
      modifyMVar_ dq (\a -> return $ tail a)
      return (Just x)

shift :: Deque -> IO (Maybe Char)
shift (Deque dq) = do
  list <- readMVar dq
  case list of
    [] -> return Nothing
    x : rest ->
      modifyMVar_ dq (\a -> return $ init a)
      return (last list)
