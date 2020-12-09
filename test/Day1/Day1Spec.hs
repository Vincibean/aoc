module Day1.Day1Spec where

import           Day1.Day1
import           Test.Hspec

spec :: Spec
spec = do
  describe "solve" $ do
    it "should give the expected result with the given sample"
      $          solve sample
      `shouldBe` 514579
    it "should give the expected result with the given sample"
      $          solve sample'
      `shouldBe` 514579
  describe "solve'" $ do
    it "should give the expected result with the given sample"
      $          solve' sample
      `shouldBe` 514579
    it "should give the expected result with the given sample"
      $          solve' sample'
      `shouldBe` 514579
  describe "solve''"
    $          it "should give the expected result with the given sample"
    $          solve'' sample
    `shouldBe` 514579
  describe "solve2" $
    it "should give the expected result with the given sample"
      $          solve2 sample
      `shouldBe` 241861950


sample = [1721, 979, 366, 299, 675, 1456]

sample' = [1010, 1721, 299]
