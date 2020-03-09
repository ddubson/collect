module ProjectMatchers (
        isGroovyGradle, isGroovyKotlin, isHaskellWithStack, ProjectMatcher,
        isReactJavascript, isNodeJs
   ) where

import Data.List (find)

type ProjectMatcher = [FilePath] -> Bool

isProjectByMatcher :: (FilePath -> Bool) -> ProjectMatcher
isProjectByMatcher matcher path = case find (matcher) $ path of
                                 Nothing -> False
                                 Just _ -> True

isGroovyGradle = isProjectByMatcher (== "build.gradle") :: ProjectMatcher
isGroovyKotlin = isProjectByMatcher (== "build.gradle.kts") :: ProjectMatcher
isHaskellWithStack path = isProjectByMatcher (== "stack.yaml") path || isProjectByMatcher (== "stack.yaml.lock") path
isNodeJs = isProjectByMatcher (== "package.json") :: ProjectMatcher

isReactJavascript :: Maybe [Char] -> Bool
isReactJavascript (Nothing) = False
isReactJavascript (Just contents) = True