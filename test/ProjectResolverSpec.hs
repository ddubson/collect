module ProjectResolverSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import ProjectResolver (resolveProjects)

spec :: Spec
spec = do
    describe "resolveProjects" $ do
        describe "when provided no recognizable projects" $ do
            it "returns an empty array" $ property $
                \x -> (resolveProjects x) `shouldBe` []
        describe "when provided a Groovy Gradle project" $ do
            it "returns Groovy Gradle" $ property $
                \x -> (resolveProjects (["build.gradle"] ++ x)) `shouldBe` ["Gradle (Groovy)"]
        describe "when provided a Groovy and Kotlin Gradle project" $ do
            it "return Groovy + Gradle project" $ property $
                \x -> (resolveProjects (["build.gradle", "build.gradle.kts"] ++ x)) `shouldBe` ["Gradle (Groovy)", "Gradle (Kotlin)"]
        describe "when provided with a Haskell/Stack project" $ do
            it "returns Haskell/Stack project in list" $ property $
                \x -> (resolveProjects (["build.gradle", "stack.yaml.lock"]++x)) `shouldBe` ["Gradle (Groovy)", "Haskell with Stack"]