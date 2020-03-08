module ProjectResolver (resolveProjects) where

import ProjectMatchers (isGroovyGradle, isGroovyKotlin, isHaskellWithStack, ProjectMatcher)
import qualified Data.Map as Map

projectMap :: Map.Map String (ProjectMatcher)
projectMap = Map.fromList [
    ("Gradle (Groovy)", isGroovyGradle),
    ("Gradle (Kotlin)", isGroovyKotlin),
    ("Haskell with Stack", isHaskellWithStack)]

resolveProjects :: [FilePath] -> [String]
resolveProjects [] = []
resolveProjects paths = Map.foldrWithKey (\key val result -> if val paths then key:result else result) [] (projectMap)

