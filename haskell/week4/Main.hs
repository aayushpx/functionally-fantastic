-- Input - Output 

put3Times :: String -> IO()
put3Times str = do putStr str
                   putStr str
                   putStr str

put3Timesa :: String -> IO()
put3Timesa str = (putStr str)
                  >> (putStr str)
                  >> (putStr str)

-- do notation in conjunction with recursion
putNtimes :: String -> Int -> IO () 
putNtimes str 1 = putStr str  -- base case
putNtimes str n = do putStr str 
                     putNtimes str (n-1)

echoLines :: IO ()
echoLines = do 
                line <- getLine 
                putStr line

echoLinesa :: IO ()
echoLinesa = getLine >>= (\line -> putStr line)


-- Read line of input and test whether it is a palindrome
palindrome :: [Int] -> Bool 
palindrome list = (list == (reverse list))

readPalindrome :: IO () -- auxillary function
readPalindrome = do 
                line <- getLine 
                putStr (show (palindrome ((read line)::[Int])))


echo :: IO ()
echo = do line <- getLine 
          if line == "" then 
            return () 
            else 
              do putStr (line ++ "\n")
                 echo

getInt :: IO Int 
getInt = do 
        line <- getLine 
        return ((read line)::Int)

-- read a series of integers (until user enters 0)
-- return them in a list
-- TODO 


-- use function getInt to repeatedly read ints (until user enters 0)
-- and print their sum 
-- TODO 


-----------------------------------------------------------------------------
--Lazy Evaluation

fib :: Int -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

-- ghci> select (5-3) (fib 11) (fib 1000)
select::Integer -> Integer -> Integer -> Integer
select n x y 
        | n > 0     = x 
        | otherwise = y


-- ghci> f (2+3) (4-1) (3+9)
f :: Integer -> Integer -> Integer -> Integer
f m n p 
        | m >= n && m >= p      = m 
        | n >= m && n >= p      = n 
        | otherwise             = p

-- write func compare two lists and determine if they are equal
-- TODO 



