module ProjectMatchersSpec (spec) where

import Test.Hspec
import ProjectMatchers (isGroovyGradle)

spec :: Spec
spec = do
    describe "ProjectMatchers" $ do
        describe "isGroovyGradle" $ do
            describe "when provided a list with no build.gradle" $ do
                it "returns False" $ do
                    (isGroovyGradle ["some.txt", "anotherfile.txt"]) `shouldBe` False
            describe "when provided a list with build.gradle" $ do
                it "returns True" $ do
                    (isGroovyGradle ["some.txt", "build.gradle"]) `shouldBe` True