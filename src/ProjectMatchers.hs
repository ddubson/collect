module ProjectMatchers (isGroovyGradle) where

import Data.List (find)

isGroovyGradle :: [FilePath] -> Bool
isGroovyGradle path = case find (== "build.gradle") $ path of
                   Nothing -> False
                   Just x -> True