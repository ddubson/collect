module CollectMain ( collectStart ) where

import System.Directory (listDirectory, getCurrentDirectory)
import ProjectResolver (resolveProjects)

collectStart :: IO ()
collectStart = do
    directory <- getCurrentDirectory
    directoryContents <- (listDirectory directory)
    putStrLn . show $ (resolveProjects directoryContents)