module ProjectMatchersSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import ProjectMatchers (isGroovyGradle, isGroovyKotlin, isHaskellWithStack)

spec :: Spec
spec = do
    describe "isHaskellWithStack" $ do
        context "when provided a list with no stack.yaml" $ do
            it "returns False" $ property $
                \x -> (isHaskellWithStack x) `shouldBe` False
        describe "when provided a list with stack.yaml" $ do
            it "returns True" $ do
                (isHaskellWithStack ["stack.yaml"]) `shouldBe` True
        describe "when provided a list with stack.yaml.lock" $ do
            it "returns True" $ do
                (isHaskellWithStack ["stack.yaml.lock"]) `shouldBe` True
    describe "isGroovyGradle" $ do
        describe "when provided a list with no build.gradle" $ do
            it "returns False" $ property $
                \x -> (isGroovyGradle x) `shouldBe` False
        describe "when provided a list with build.gradle" $ do
            it "returns True" $ do
                (isGroovyGradle ["some.txt", "build.gradle"]) `shouldBe` True
    describe "isGroovyKotlin" $ do
        describe "when provided a list with no build.gradle.kts" $ do
            it "returns False" $ property $
                \x -> (isGroovyKotlin x) `shouldBe` False
        describe "when provided a list with build.gradle.kts" $ do
            it "returns True" $ do
                (isGroovyKotlin ["some.txt", "build.gradle.kts"]) `shouldBe` True