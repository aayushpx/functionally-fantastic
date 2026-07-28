-- comment
{- Multi
line comment
 -}

module Main where

square :: Int -> Int
square x = x * x

main :: IO ()
main = do 
    putStrLn "Enter a number: "
    input <- getLine
    let number = read input :: Int
    putStrLn ("The square is " ++ show (square number))

-- guards are similar to piecewise functions in mathematics

absolute :: Int -> Int
absolute x
    | x >= 0 = x
    | otherwise = -x
