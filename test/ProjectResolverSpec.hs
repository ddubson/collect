module ProjectResolverSpec (spec) where

import Test.Hspec
import ProjectResolver (resolveProjects)

spec :: Spec
spec = do
    describe "resolveProjects" $ do
        describe "when provided a Groovy Gradle project" $ do
            it "returns Groovy Gradle" $ do
                (resolveProjects ["build.gradle", "some.txt"]) `shouldBe` ["Gradle (Groovy)"]
        describe "when provided a Groovy and Kotlin Gradle project" $ do
            it "return Groovy + Gradle project" $ do
                (resolveProjects ["build.gradle", "build.gradle.kts"]) `shouldBe` ["Gradle (Groovy)", "Gradle (Kotlin)"]
        describe "when provided with a Haskell/Stack project" $ do
            it "returns Haskell/Stack project in list" $ do
                (resolveProjects ["build.gradle", "stack.yaml.lock"]) `shouldBe` ["Gradle (Groovy)", "Haskell with Stack"]