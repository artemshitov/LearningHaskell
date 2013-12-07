import Data.List

pack :: Eq a => [a] -> [[a]]
pack = group

pack' :: Eq a => [a] -> [[a]]
pack' [] = []
pack' (x:xs) = h : (pack' t)
  where (h,t) = span (== x) (x:xs)
