{-# LANGUAGE QuasiQuotes #-}

module Day2.Day2Spec where

import           Day2.Day2
import           Test.Hspec
import           Text.RawString.QQ              ( r )

spec :: Spec
spec =
  describe "solve"
    $          it "should give the expected result with the given sample"
    $          solve sample
    `shouldBe` Right 2


sample :: String
sample = [r|
1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc
|]
