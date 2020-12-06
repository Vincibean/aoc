module Day1.Day1
  ( solve
  )
where

year = 2020

solve :: [Int] -> Int
solve is = head
  [ x * y | (i, x) <- xs, (i', y) <- xs, x + y == 2020 && i /= i' ]
  where xs = [0 .. (length is)] `zip` is
