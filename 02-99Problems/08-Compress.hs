import Data.List

compress :: (Eq a) => [a] -> [a]
compress [] = []
compress (x:xs) = x : (compress $ dropWhile (== x) xs)

compress' :: (Eq a) => [a] -> [a]
compress' xs = map head $ group xs 
