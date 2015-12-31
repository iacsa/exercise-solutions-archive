module BankAccount (
  BankAccount,
  openAccount,
  closeAccount,
  getBalance,
  incrementBalance
) where

import Control.Concurrent (MVar, readMVar, newMVar, modifyMVar_)

newtype BankAccount = Account (MVar (Maybe Integer))

openAccount :: IO BankAccount
openAccount = newMVar (Just 0) >>= return . Account

closeAccount :: BankAccount -> IO ()
closeAccount (Account var) = modifyMVar_ var $ return . const Nothing

getBalance :: BankAccount -> IO (Maybe Integer)
getBalance (Account var) = readMVar var

incrementBalance :: BankAccount -> Integer -> IO (Maybe Integer)
incrementBalance (Account var) amount = do
  balance <- fmap (+ amount) <$> readMVar var
  modifyMVar_ var $ return . const balance
  return balance
