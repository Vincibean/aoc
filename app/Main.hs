module Main where

import qualified Day1.Day1                     as D1
import qualified Day2.Day2                     as D2

main :: IO ()
main = do
  i <- (read <$>) . lines <$> readFile "resources/day1.txt"
  putStrLn $ "Day 1 (a): " <> show (D1.solve' i)
  putStrLn $ "Day 1 (b): " <> show (D1.solve2 i)
  psws <- readFile "resources/day2.txt"
  putStrLn $ "Day 2 (a): " <> show (D2.solve psws)
