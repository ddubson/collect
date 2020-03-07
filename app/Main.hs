module Main where

import Lib
import Data.List (find)
import System.Directory (listDirectory, getCurrentDirectory)

gradleGroovyMatch = "build.gradle"

main :: IO ()
main = do
    -- Read current directory
    -- Identify if build.gradle exists in current directory
    directory <- getCurrentDirectory
    directoryContents <- (listDirectory directory)
    let maybeGradleGroovy = find (== gradleGroovyMatch) directoryContents :: Maybe [Char]
    case maybeGradleGroovy of
        Nothing -> print "Unable to determine project type."
        Just x -> print "Gradle (Groovy) project"