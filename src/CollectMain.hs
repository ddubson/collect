module CollectMain ( collectStart ) where

import Data.List (find)
import System.Directory (listDirectory, getCurrentDirectory)
import ProjectMatchers (isGroovyGradle)

gradleGroovyMatch = "build.gradle"

collectStart :: IO ()
collectStart = do
    directory <- getCurrentDirectory
    directoryContents <- (listDirectory directory)
    if isGroovyGradle directoryContents
        then print "Gradle (Groovy) project"
        else print "Unable to determine project type."
