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

