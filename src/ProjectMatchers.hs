module ProjectMatchers (isGroovyGradle, isGroovyKotlin) where

import Data.List (find)

isProjectByMatcher :: (FilePath -> Bool) -> [FilePath] -> Bool
isProjectByMatcher matcher path = case find (matcher) $ path of
                                 Nothing -> False
                                 Just _ -> True

isGroovyGradle :: [FilePath] -> Bool
isGroovyGradle path = isProjectByMatcher (== "build.gradle") path

isGroovyKotlin :: [FilePath] -> Bool
isGroovyKotlin path = isProjectByMatcher (== "build.gradle.kts") path