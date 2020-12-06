module Day1.Day1
  ( solve
  , solve'
  )
where

import           Control.Monad                  ( guard )

solve :: [Int] -> Int
solve is = head
  [ x * y | (i, x) <- xs, (i', y) <- xs, x + y == 2020 && i /= i' ]
  where xs = [0 .. (length is)] `zip` is


solve' :: [Int] -> Int
solve' is = head $ do
  let xs = [0 .. (length is)] `zip` is
  (i , x) <- xs
  (i', y) <- xs
  guard (x + y == 2020 && i /= i')
  return $ x * y
