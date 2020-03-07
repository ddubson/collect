module ProjectMatchersSpec (spec) where

import Test.Hspec
import ProjectMatchers (isGroovyGradle, isGroovyKotlin)

spec :: Spec
spec = do
    describe "isGroovyGradle" $ do
        describe "when provided a list with no build.gradle" $ do
            it "returns False" $ do
                (isGroovyGradle ["some.txt", "anotherfile.txt"]) `shouldBe` False
        describe "when provided a list with build.gradle" $ do
            it "returns True" $ do
                (isGroovyGradle ["some.txt", "build.gradle"]) `shouldBe` True
    describe "isGroovyKotlin" $ do
        describe "when provided a list with no build.gradle.kts" $ do
            it "returns False" $ do
                (isGroovyKotlin ["some.txt", "anotherfile.txt"]) `shouldBe` False
        describe "when provided a list with build.gradle.kts" $ do
            it "retuns True" $ do
                (isGroovyKotlin ["some.txt", "build.gradle.kts"]) `shouldBe` True