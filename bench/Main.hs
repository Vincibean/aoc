module Main where

import           Criterion.Main

import           Day1.Day1

sample = take 10000 $ cycle [1721, 979, 366, 299, 675, 1456]

main = defaultMain
  [ bgroup
      "Day 1"
      [ bench "solve" $ whnf solve sample
      , bench "solve'" $ whnf solve' sample
      , bench "solve''" $ whnf solve'' sample
      ]
  ]
