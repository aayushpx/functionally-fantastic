{-
Write a function squares that takes a whole number and returns a list of all the perfect squares (a number which is the square of an integer) from 1 up to (and possibly including) the given number. You may write additional helper functions if you wish.
example behaviour
> squares 90
[1, 4, 9, 16, 25, 36, 49, 64, 81]
-}

import Data.Char

-- with guards and recursion
-- squares :: Int -> [Int]
-- squares n        = helper n 1
--
-- helper :: Int -> Int -> [Int]
-- helper n i
-- | i^2 > n         = []
-- | otherwise       = i^2 : helper n (i+1)

-- if-then-else statements and recursion 
-- squares :: Int -> [Int]
-- squares n        = helper n 1
--
-- helper :: Int -> Int -> [Int]
-- helper n i =
--   if i^2 > n then []
--   else i^2 : helper n (i+1)

-- list comprehension without recursion
-- squares :: Int -> [Int]
-- squares n        = helper n 1
--
-- helper :: Int -> Int -> [Int]
-- helper n i        = [i^2 | i <- [1..n], i^2 <= n]

-- higher-order function without recursion 
squares :: Int -> [Int]
squares n        = map (^2) (helper n 1)

helper :: Int -> Int -> [Int]
helper n i        = [i | i <- [1..n], i^2 <= n]


-- Polymorphic functions 

{-
A function that calculates the sum of a list of numbers

example behaviour

> sum [1,2,3,4]
10

> sum [1.5, 3.7, 5.2, 8.4]
18.8
-}

mySum :: (Num a) => [a] -> a
mySum []      = 0
mySum (x:xs)  = x + (mySum xs)

{-
Implement a function that takes a tuple of two lists and returns a list of tuples.

example behaviour
> convert ([1,2,3,4],['d','c','b','a'])
[(1,'d'), (2,'c'), (3,'b'), (4,'a')]
-}

convert :: ([a], [b]) -> [(a, b)]
convert (_, [])        = []
convert (l1, l2)     = zip l1 l2

{-
 Write a higher-order function countIf that takes a list and a function and counts the number of elements in the list for which the function returns True.

example behaviour:

> countIf [2,5,4,3,6,7,11] even
3
-}

countIf :: [a] -> (a -> Bool) -> Int 
countIf [] _        = 0
countIf (x:xs) p
  | p x       = 1 + (countIf xs p)
  | otherwise = countIf xs p


{-
Write a higher-order function called mapNTimes that takes a function f, an integer n and a list. The function f should be applied to each element in the list n times.

example behaviour

> mapNTimes (+2) 3 [1, 2, 3, 4]
[7, 8, 9, 10]

> mapNTimes (^2) 2 [1, 2, 3, 4]
[1, 16, 81, 256]
-}

mapNTimes :: (a -> a) -> Int -> [a] -> [a]
mapNTimes f 0 lst       = lst
mapNTimes f n lst       = mapNTimes f (n-1) (map f (lst))
-- mapNTimes       = \f -> \n -> \xs -> map f xs 
-- mapNTimes f n lst       = [f x | x <- lst]














