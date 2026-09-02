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

