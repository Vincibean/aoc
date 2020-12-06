module Day1.Day1Spec where

import           Day1.Day1
import           Test.Hspec

spec :: Spec
spec = describe "solve" $ do
  it "should give the expected result with the given sample" $ do
    let sample = [1721, 979, 366, 299, 675, 1456]
    solve sample `shouldBe` 514579
  it "should give the expected result with the given sample"
    $          solve [1010, 1721, 299]
    `shouldBe` 514579


