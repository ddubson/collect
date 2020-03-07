module Main where

import Lib
import System.Directory (getCurrentDirectory)

main :: IO ()
main = do
    -- Read current directory
    -- Identify if build.gradle exists in current directory
    directory <- getCurrentDirectory
    putStrLn $ directory