module Main where
import Language.Haskell.TH (varStrictType)

main :: IO ()
main = putStrLn "Starting program..."


my_sum :: [Int] -> Int
my_sum []        = 0 
my_sum (h:t)     = h + (my_sum t)

list_length :: [Int] -> Int
list_length []        = 0 -- base case
list_length (h:t)     = 1 + list_length t -- recursive case

list_append :: [Int] -> [Int] -> [Int]
list_append [] list       = list 
list_append (h:t) list    = h: (list_append t list)

f_remove :: Int -> [Int] -> [Int]
f_remove _ [] = []
f_remove e (h:t)
    | e == h        = t -- if element is equal to head, then return tail
    | otherwise     = h: (f_remove e t)

listRemoveAll :: Int -> [Int] -> [Int]
listRemoveAll _ [] = [] -- wtf does this line do 
listRemoveAll e (h:t)
    | e == h        = listRemoveAll e t
    | otherwise     = h: (listRemoveAll e t)

isMember :: Int -> [Int] -> Bool 
isMember _ []       = False -- first arg and empty list, return False
isMember e (h:t)
    | e == h        = True
    | otherwise     = isMember e t


-- list comprehension
-- [expression | element <- source, condition]

qsort :: [Int] -> [Int]
qsort [] = []
qsort (h:t) = qsort [x | x <- t, x < h]
              ++ [h] ++
              qsort [x | x <- t, x>= h]

-- partitionLT :: [Int] -> Int -> [Int]

-- Polymorphism
{- Strong and statis typed language.
 - Strongly typed languages bind data types to vars.
 - Has type-inference system. 
 - If no type is defined, Haskell will not allow u do it.-}

answer :: Int 
answer        = 42

add2 :: Float -> Float -> Float 
add2 a b       = (a + b)

-- add2 1 (fromIntegral answer)




genListA :: Int -> Int -> [Int]
genListA a b 
    | a == b        = [a]
    | a <= b         = a : (genListA (a+1) b)
    | otherwise     = error "a must be greater than b"

genListA2 :: Int -> Int -> [Int]
genListA2 a b 
    | b < a       = []
    | otherwise   = a : genListA2 (a+a) b

genListB :: Int -> Int -> [Int]
genListB a b        = [a..b]


genListB2 :: Int -> Int -> [Int]
genListB2 a b 
    | a <= b        = [a..b]
    | otherwise     = [a, a-2..b]

-- ghci> [ 2^x | x <- [0..9]]
-- [1,2,4,8,16,32,64,128,256,512]
-- ghci>

isPow2 :: Int -> Bool 
isPow2 a
    | a <= 0          = False 
    | a == 1          = True 
    | a `mod` 2 == 0  = isPow2 (a `div` 2)
 -- | mod a 2 == 0     = isPow (div a 2)
    | otherwise       = False

isPow2A :: Int -> Bool
isPow2A x = (y - (fromIntegral (floor y)) == 0)
    where y = logBase 2 (fromIntegral x)

-- ghci> [isPow2A x | x <- [1..10]]
-- [True,True,False,True,False,False,False,True,False,False]


filterPow2 :: [Int] -> [Int]
filterPow2 [] = []
filterPow2 xs =
        [x | x <- xs, isPow2 x]
--        | isPow2 x = x: filterPow2 xs -- concatenates and calls func
 --       | otherwise = filterPow2 xs -- calls func without concat

markPow2 [] = []
markPow2 (x:xs) = 
        (x, isPow2 x) : markPow2 xs

ints :: [Int]
ints = [1, 2, 3]

floats :: [Float]
floats = [1.1, 2.2]

doubles :: [Double]
doubles = [3.14, 5.23]

-- Polymorphism

len :: [a] -> Int -- any type of list for input
len []      = 0 
len (_:xs)  = 1 + len xs


 -- takes in list of some type a, provided that a is a real number type
mean :: Real a => [a] -> Double 
mean xs = 
        realToFrac (sum xs) / realToFrac (len xs)

var :: Real a => [a] -> Double 
var xs =
        sum [(realToFrac x - m)^2 | x <- xs] / fromIntegral (len xs)
        where 
            m = mean xs


sd :: Real a => [a] -> Double
sd xs = sqrt (var xs)
