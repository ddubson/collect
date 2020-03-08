module ProjectMatchersSpec (spec) where

import Test.Hspec
import ProjectMatchers (isGroovyGradle, isGroovyKotlin, isHaskellWithStack)

spec :: Spec
spec = do
    describe "isHaskellWithStack" $ do
        describe "when provided a list with no stack.yaml" $ do
            it "returns False" $ do
                (isHaskellWithStack ["some.txt"]) `shouldBe` False
        describe "when provided a list with stack.yaml" $ do
            it "returns True" $ do
                (isHaskellWithStack ["stack.yaml"]) `shouldBe` True
        describe "when provided a list with stack.yaml.lock" $ do
            it "returns True" $ do
                (isHaskellWithStack ["stack.yaml.lock"]) `shouldBe` True
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