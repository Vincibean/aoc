module Day2.Day2
  ( solve
  )
where

import           Data.Functor
import           Text.Trifecta

type Password = String

data PasswordPolicy = PasswordPolicy { char :: Char, minLetters :: Integer, maxLetters :: Integer } deriving (Show, Eq)

data PasswordRecord = PasswordRecord PasswordPolicy Password deriving (Show, Eq)

newtype Error = Error { message :: String } deriving (Show, Eq)

type Result' n = Either Error n

solve :: Num n => String -> Result' n
solve s = do
  psws <- parseString' parsePasswordRecords s
  return $ countP validPassword psws

validPassword :: PasswordRecord -> Bool
validPassword (PasswordRecord (PasswordPolicy c min max) psw) =
  min <= occurrences && occurrences <= max
  where occurrences = countP (== c) psw

countP :: Num n => (a -> Bool) -> [a] -> n
countP p = go 0
 where
  go n [] = n
  go n (x : xs) | p x       = go (n + 1) xs
                | otherwise = go n xs

result' :: Result a -> Result' a
result' (Failure e) = Left $ Error $ show e
result' (Success n) = Right n

parseString' :: Parser a -> String -> Result' a
parseString' p = result' . parseString p mempty

hyphen :: TokenParsing m => m Char
hyphen = symbolic '-'

eol :: Parser ()
eol = void newline

parsePasswordPolicy :: Parser PasswordPolicy
parsePasswordPolicy = do
  min <- decimal
  hyphen
  max <- decimal
  whiteSpace
  c <- letter
  return $ PasswordPolicy c min max

parsePassword :: Parser Password
parsePassword = many letter

parsePasswordRecord :: Parser PasswordRecord
parsePasswordRecord = do
  pp <- parsePasswordPolicy
  colon
  whiteSpace
  p <- parsePassword
  eol
  return $ PasswordRecord pp p

parsePasswordRecords :: Parser [PasswordRecord]
parsePasswordRecords = do
  skipMany eol
  psws <- many parsePasswordRecord
  skipMany eol
  eof
  return psws
