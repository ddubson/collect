module CollectMain ( collectStart ) where

import System.Directory (listDirectory, getCurrentDirectory)
import ProjectResolver (resolveProjects)

collectStart :: IO ()
collectStart = do
    contents <- readCurrentDirectory
    putStrLn . show $ resolveProjects contents

readCurrentDirectory :: IO [FilePath]
readCurrentDirectory = do
    directory <- getCurrentDirectory
    directoryContents <- (listDirectory directory)
    return directoryContents