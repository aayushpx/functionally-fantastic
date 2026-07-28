module Main where

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





