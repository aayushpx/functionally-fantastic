module SimpleFunctions where 
import Data.Fixed (E0)

addTwo :: Int -> Int -> Int 
addTwo x y = x + y

pow3 :: Int -> Int 
pow3 x 
        | x == 0      = 0 
        | otherwise   = x*x*x

max2 :: Int -> Int -> Int 
max2 a b 
        | a == b    = error "both are equal"
        | a > b     = a
        | otherwise = b

diff3 :: Int -> Int -> Int -> Bool
diff3 a b c
        | a /= b && b /= c     = True 
        | otherwise            = False

sumA :: Int -> Int
sumA n 
        | n == 0      = 0 
        | otherwise   = n + sumA (n-1)

sumB :: Int -> Int 
sumB n = 
        if n == 0
          then 0
          else n + sumB (n-1)

sumC :: Int -> Int 
sumC 0 = 0 
sumC n = n + sumC (n-1)

sumD :: Int -> Int 
sumD n = sum [1..n]

sumE :: Int -> Int 
sumE n 
        | n == 0      = 0 
        | otherwise   = div (n * (n + 1)) 2

lengthList :: [Int] -> Int 
lengthList [] = 0 
lengthList (x:xs) = 1 + lengthList xs
