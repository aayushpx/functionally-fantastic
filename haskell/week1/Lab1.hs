min2 :: Int -> Int -> Int
min2 a b 
    | a < b = a 
    | otherwise = b

{-min4 :: Int -> Int -> Int -> Int -> Int
min4 a b c d
    | a <= b && a <= c && a <= d = a 
    | b <= c && b <= d = b 
    | c <= d = c
    | otherwise = d
-}
min4 :: Int -> Int -> Int -> Int -> Int
min4 a b c d = min2 (min2 a b) (min2 c d)

-- functionName arg1 arg2 = expression

vectorLength :: Floating a => a -> a -> a
vectorLength x y = sqrt(x^2 + y^2)
