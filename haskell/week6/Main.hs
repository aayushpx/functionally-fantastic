import Data.Char

anyy :: (a -> Bool) -> [a] -> Bool 
anyy p []        = False
anyy p (h:t)
  | p h       = False 
  | otherwise  = anyy p t

alll :: (a -> Bool) -> [a] -> Bool 
alll p [x]       = p x
alll p (h:t)     = (p h) && (alll p t)

isort :: (a -> a -> Bool) -> [a] -> [a]
isort _ []        = []
isort f (h:t)     = insert f h (isort f t)

insert :: (a -> a -> Bool) -> a -> [a] -> [a]
insert _ x []       = [x]
insert f x (h:t)
  | f x h       = x:h:t 
  | otherwise   = h:(insert f x t)

-- Vectors (Linear Algebra)
data Vector       = Vector [Float] -- new data type called Vector, with constructor that is also called Vector, containing list of Floats
  deriving (Show)

addVector :: Vector -> Vector -> Vector 
addVector (Vector u) (Vector v)       = Vector (zipWith (+) u v)

{- 
 - zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
 - (+) :: Num d => d -> d
 - When (+) is given to zipWith,
 - a = d, b = d, c = d, so 
 - zipWith (+) :: Num d => [d] -> [d] -> [d]
 - Because u :: [Float] and v:: [Float], d becomes a Float:
 - zipWith (+) :: [Float] -> [Float] -> [Float]
 - Then Vector (...) wraps the resulting list back into a Vector.
 -
 - addVector uses pattern matching against theVector constructor to extract the underlying lists.
 - The vector operation uses partial application.
 - -}

subVector :: Vector -> Vector -> Vector 
subVector (Vector u) (Vector v)       = Vector (zipWith (-) u v)

dotProduct :: Vector -> Vector -> Float
dotProduct (Vector u) (Vector v)       = sum (zipWith (*) u v)

multVector :: Float -> Vector -> Vector
multVector c1 (Vector v)       = Vector (map (* c1) v)

lenVector :: Vector -> Float
lenVector (Vector u)        = sqrt (sum (map (\x -> x^2) u))

{-
 - lenVector uses pattern matching to extract u 
 - partial application with map (\x -> x^2)
 - lambda expression
 - sum to reduce the list of swuared coordinates to one Float 
 - sqrt to calculate the final magnitude
 - -}
