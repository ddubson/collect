module ProjectMatchersSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import ProjectMatchers (isGroovyGradle, isNodeJs, isGroovyKotlin,
                        isHaskellWithStack, isReactJavascript)

spec :: Spec
spec = do
    describe "isHaskellWithStack" $ do
        context "when provided a list with no stack.yaml" $ do
            it "returns False" $ property $
                \x -> (isHaskellWithStack x) `shouldBe` False
        describe "when provided a list with stack.yaml" $ do
            it "returns True" $ property $
                \x -> (isHaskellWithStack (["stack.yaml"]++x)) `shouldBe` True
        describe "when provided a list with stack.yaml.lock" $ do
            it "returns True" $ property $
                \x -> (isHaskellWithStack (["stack.yaml.lock"]++x)) `shouldBe` True
    describe "isGroovyGradle" $ do
        describe "when provided a list with no build.gradle" $ do
            it "returns False" $ property $
                \x -> (isGroovyGradle x) `shouldBe` False
        describe "when provided a list with build.gradle" $ do
            it "returns True" $ property $
                \x -> (isGroovyGradle (["build.gradle"]++x)) `shouldBe` True
    describe "isGroovyKotlin" $ do
        describe "when provided a list with no build.gradle.kts" $ do
            it "returns False" $ property $
                \x -> (isGroovyKotlin x) `shouldBe` False
        describe "when provided a list with build.gradle.kts" $ do
            it "returns True" $ property $
                \x -> (isGroovyKotlin (["build.gradle.kts"]++x)) `shouldBe` True
    describe "isNodeJs" $ do
        describe "when provided a list without package.json" $ do
            it "returns False" $ property $
                \x -> (isNodeJs x) `shouldBe` False
        describe "when provided a list with package.json" $ do
            it "returns True" $ property $
                \x -> (isNodeJs (["package.json"]++x)) `shouldBe` True
    describe "isReactJavascript" $ do
        describe "when provided file contents containing a React/ReactDOM dependency" $ do
            it "returns True" $ property $
                \x -> (isReactJavascript (Just x)) `shouldBe` True