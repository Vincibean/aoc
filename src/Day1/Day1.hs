module Day1.Day1
  ( solve
  , solve'
  , solve''
  , solve2
  )
where

import           Control.Monad                  ( guard )
import qualified Data.IntSet                   as IntSet


solve :: [Int] -> Int
solve is = head
  [ x * y | (i, x) <- xs, (i', y) <- xs, x + y == 2020 && i /= i' ]
  where xs = zipWithIndex is


solve' :: [Int] -> Int
solve' is = head $ do
  let xs = zipWithIndex is
  (i , x) <- xs
  (i', y) <- xs
  guard (x + y == 2020 && i /= i')
  return $ x * y


solve'' :: [Int] -> Int
solve'' is = head [ t n * n | n <- is, IntSet.member (t n) s ]
 where
  s = IntSet.fromList is
  t = (2020 -)


solve2 :: [Int] -> Int
solve2 xs = head $ do
  x <- xs
  y <- xs
  z <- xs
  guard (x + y + z == 2020)
  return $ x * y * z

zipWithIndex :: [b] -> [(Int, b)]
zipWithIndex is = [0 .. (length is)] `zip` is
