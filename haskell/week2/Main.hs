module Main (main) where
import SimpleFunctions (addTwo)
import SimpleFunctions (pow3)
import SimpleFunctions (max2)
import SimpleFunctions (diff3)
import SimpleFunctions (sumA)
import SimpleFunctions (sumB)
import SimpleFunctions (sumC)
import SimpleFunctions (sumD)
import SimpleFunctions (sumE)
import SimpleFunctions (lengthList)
import Data.Char

main :: IO ()
main = putStrLn "Starting program..."

offset :: Int
offset = ord 'A' - ord 'a'

toCapital :: Char -> Char
toCapital c = chr (ord c + offset)

myToLower :: Char -> Char
myToLower c = chr (ord c - offset)

myIsDigit :: Char -> Bool
myIsDigit c = ('0' <= c) && (c <= '9')

factInt :: Int -> Int
factInt n = product [1..n]

factInteger :: Integer -> Integer
factInteger n = product [1..n]

myAbs x = if x >= 0 then x else -x


add :: Int -> Int -> Int
add a b 
    | a == 0        = b 
    | b == 0        = a 
    | otherwise     = a + b
{-add a 0       = a
add 0 b       = b
add a b       = a + b-}

multiply :: Int -> Int -> Int
multiply 0 _        = 0 -- '_' is a wildcard
multiply _ 0        = 0 
multiply x y        = x * y

fact :: Int -> Int
fact 0 = 1 
fact n 
        | n > 0       = n* fact (n - 1)
        | otherwise   = error "fact only defined for n > 0"

-- F_n = F_n-1 + f_n-2, F_0 = 1, F_1 = 1
fib :: Int -> Int
fib 0 = 1 
fib 1 = 1 
fib n 
        | n > 1       = fib (n-1) + fib (n-2)
        | otherwise    = error "fib only defined for n > 0"


type Point2D = (Int, Int)

makePoint :: Int -> Int -> Point2D 
makePoint x y = (x, y)

-- extract x or y vals
getX :: Point2D -> Int 
getX (x, _) = x 

getY :: Point2D -> Int 
getY (_, y) = y


-- adding points 
addPoint2D :: Point2D -> Point2D -> Point2D 
addPoint2D (x1, y1) (x2, y2) = (x1+x2, y1+y2)

-- Euclidean distance
distance :: Point2D -> Point2D -> Float 
distance (x1, y1) (x2, y2) =
        sqrt (fromIntegral ((x2-x1)*(x2-x1) +
                            (y2-y1)*(y2-y1)))
