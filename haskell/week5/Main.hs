-- import Prelude hiding (map)
import Data.Char

cube :: Num a => a -> a
cube x = x * x * x 

cubeAll :: Num a => [a] -> [a]
cubeAll list     = [(cube x) | x <- list]

-- map :: (a -> b) -> [a] -> [b]
-- map _ []      = []
-- map f (h:t)   = (f h) : (map f t)

-- using list comprehension
-- map :: (a -> b) -> [a] -> [b]
-- map f list      = [(f x) | x <- list]

isPrime :: Int -> Bool 
isPrime n 
      | n < 2       = False 
      | otherwise   = null [x | x <- [2..n-1], n `mod` x == 0]



fact :: Integer -> Integer 
fact n   = foldr (*) 1 [1..n]

multiply :: Int -> Int -> Int
multiply x y = x*y

double :: Int -> Int
double  = multiply 2

myMap :: (a -> b) -> [a] -> [b]
myMap f []        = []
myMap f (x:xs)    = f x : myMap f xs


myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p []       = []
myFilter p (x:xs)
  | p x       = x : myFilter p xs 
  | otherwise = myFilter p xs

  -- high-order function mapfilter
mapfilter :: (a -> Bool) -> (a -> b) -> [a] -> [b]
mapfilter p f []        = []
mapfilter p f (x:xs)
  | p x       = f x : mapfilter p f xs 
  | otherwise = mapfilter p f xs

mapfilter2 :: (a -> Bool) -> (a -> b) -> [a] -> [b]
mapfilter2 p f lst       = map f (filter p lst)

mapfilter3 :: (a -> Bool) -> (a -> b) -> [a] -> [b]
mapfilter3 p f        = (map f . filter p)

mapfilter4 :: (a -> Bool) -> (a -> b) -> [a] -> [b]
mapfilter4 = \p -> \f -> \xs -> map f (filter p xs)

{-
*Main> mapfilter even (*10) [1..10]
[20,40,60,80,100]

*Main> mapfilter2 even (*10) [1..10]
[20,40,60,80,100]

*Main> mapfilter3 even (*10) [1..10]
[20,40,60,80,100]

*Main> mapfilter4 even (*10) [1..10]
[20,40,60,80,100]
-}
