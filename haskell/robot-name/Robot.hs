module Robot (mkRobot, robotName, resetName) where

import Control.Concurrent (MVar, readMVar, newMVar, modifyMVar_)
import System.Random (randomRIO)

newtype Robot = Robot (MVar String)

mkRobot :: IO Robot
mkRobot = generateName >>= newMVar >>= return . Robot

robotName :: Robot -> IO String
robotName (Robot r) = readMVar r

resetName :: Robot -> IO ()
resetName (Robot r) = modifyMVar_ r (const generateName)

generateName :: IO String
generateName =
  mapM randomRIO [('A', 'Z'), ('A', 'Z'), ('0', '9'), ('0', '9'), ('0', '9')]
