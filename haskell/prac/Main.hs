{-
Write a function squares that takes a whole number and returns a list of all the perfect squares (a number which is the square of an integer) from 1 up to (and possibly including) the given number. You may write additional helper functions if you wish.
example behaviour
> squares 90
[1, 4, 9, 16, 25, 36, 49, 64, 81]
-}

import Data.Char

squares :: Int -> [Int]
squares n       = map (^2) (helper n 1)

helper :: Int -> Int -> [Int]
helper n i        = [i | i <- [1..n], i^2 < n]

-- helper n i        = [i^2 | i <- [1..n], i^2 < n]
  -- if i^2 > n then []
  -- else i^2 : helper n (i+1)
  -- | i^2 > n       = []
  -- | otherwise     = i^2 : helper n (i+1)
