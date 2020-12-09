module Main where

import Day1.Day1

main :: IO ()
main = do
    i <- (read <$>) . lines <$> readFile "resources/day1.txt"
    putStrLn $ "Day 1 (a): " <> show (solve' i)
    putStrLn $ "Day 1 (b): " <> show (solve2 i)