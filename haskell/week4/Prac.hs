countEven :: [Int] -> Int 
countEven []      = 0 

countEven (x:xs)
      | x `mod` 2 == 0       = 1 + countEven xs 
      | otherwise            = countEven xs

doubleList :: [Int] -> [Int]
doubleList []     = [] 

doubleList (x:xs) = (2*x) : doubleList xs 

onlyEven :: [Int] -> [Int]
onlyEven []     = []
onlyEven (x:xs) 
      | x `mod` 2 == 0      = x : onlyEven xs 
      | otherwise           = onlyEven xs 

removeNeg :: [Int] -> [Int]
removeNeg []      = []

removeNeg (x:xs)
      | x >= 0     = x : removeNeg xs 
      | otherwise = removeNeg xs

contains :: Int -> [Int] -> Bool 
contains n []     = False 
contains n (x:xs)
      | n == x      = True
      | otherwise   = contains n xs

allPos :: [Int] -> Bool 
allPos []      = True  -- vacuous truth 
allPos (x:xs)
      | x > 0     = allPos xs 
      | otherwise = False 





