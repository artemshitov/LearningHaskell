myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

myReverse' :: [a] -> [a]
myReverse' xs = loop xs []
  where loop [] acc = acc 
        loop (y:ys) acc = loop ys $ y:acc

myReverse'' :: [a] -> [a]
myReverse'' = foldl (flip (:)) []
