module Deque (Deque, mkDeque, pop, push, shift, unshift) where

import qualified Control.Concurrent.STM as ST
import qualified Data.Sequence as S

newtype Deque a = Deque (ST.TVar (S.Seq a))

mkDeque :: IO (Deque a)
mkDeque = ST.atomically $ Deque <$> ST.newTVar S.empty

push :: Deque a -> a -> IO ()
push (Deque dq) = ST.atomically . ST.modifyTVar dq . flip (S.|>)

unshift :: Deque a -> a -> IO ()
unshift (Deque dq) = ST.atomically . ST.modifyTVar dq . (S.<|)

pop :: Deque a -> IO (Maybe a)
pop (Deque dq) = ST.atomically $ do
  len <- S.length <$> ST.readTVar dq
  item <- (flip S.index) (len - 1) <$> ST.readTVar dq
  ST.modifyTVar dq (S.take (len - 1))
  return (Just item)

shift :: Deque a -> IO (Maybe a)
shift (Deque dq) = ST.atomically $ do
  item <- (flip S.index) 0 <$> ST.readTVar dq
  ST.modifyTVar dq (S.drop 1)
  return (Just item)
