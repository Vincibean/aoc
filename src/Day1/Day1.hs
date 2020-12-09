module Day1.Day1
  ( solve
  , solve'
  , solve''
  )
where

import           Control.Monad                  ( guard )
import qualified Data.IntSet                   as IntSet

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


solve'' :: [Int] -> Int
solve'' is = head [ t n * n | n <- is, IntSet.member (t n) s ]
 where
  s = IntSet.fromList is
  t = (2020 -)
