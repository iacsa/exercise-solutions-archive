module BankAccount
  ( BankAccount
  , openAccount
  , closeAccount
  , getBalance
  , incrementBalance
  ) where 

import Control.Concurrent.STM
  ( TVar
  , readTVar
  , newTVar
  , writeTVar
  , modifyTVar
  , atomically
  )

newtype BankAccount = Account (TVar (Maybe Integer))

openAccount :: IO BankAccount
openAccount = atomically $ Account <$> newTVar (Just 0)

closeAccount :: BankAccount -> IO ()
closeAccount (Account var) = atomically $ writeTVar var Nothing

getBalance :: BankAccount -> IO (Maybe Integer)
getBalance (Account var) = atomically $ readTVar var

incrementBalance :: BankAccount -> Integer -> IO (Maybe Integer)
incrementBalance (Account var) amount = atomically $ do
  modifyTVar var $ fmap (+ amount)
  readTVar var
