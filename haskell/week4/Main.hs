import Data.Char 
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


------------------------------------------------------------------------------
-- Lab 04

helloWorlda :: IO ()
helloWorlda = putStrLn "Hello World"

echoa :: IO ()
echoa = do
        putStr "Enter a line: "
        line <- getLine 

        if line == "stop"
          then return ()
          else do 
            putStrLn line 
            echoa

readLines :: IO [String]
readLines = do 
        line <- getLine 

        if line == "END"
          then return []
          else do 
            rest <- readLines 
            return (line : rest) -- builds a list recursively 

cleanLine :: String -> String 
cleanLine = filter (\c -> isAlphaNum c || c == ' ')

echoFormat :: IO () 
echoFormat = do 
        lines <- readLines 
        putStrLn (unlines (map cleanLine lines))


readPoint :: IO (Int, Int, Int)
readPoint = do 
        line <- getLine 
        return (read line :: (Int, Int, Int))


-- d = sqrt[(x_2 - x_1)^2+(y_2 - y_1)^2+(z_2 - z_1)^2]

distance :: (Int, Int, Int) -> (Int, Int, Int) -> Double 
distance (x1, y1, z1) (x2, y2, z2) =
        sqrt (dx^2 + dy^2 + dz^2)
      where 
        dx = fromIntegral (x2 - x1)
        dy = fromIntegral (y2 - y1)
        dz = fromIntegral (z2 - z1)

readDistance :: IO ()
readDistance = do 
        putStrLn "Enter a point A: "
        p1 <- readPoint 

        putStrLn "Enter point B: "
        p2 <- readPoint 

        putStrLn ("Distance between Point A and B is: " ++ show (distance p1 p2))

