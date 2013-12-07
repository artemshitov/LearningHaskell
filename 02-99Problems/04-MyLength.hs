myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

myLength' :: [a] -> Int
myLength' xs = loop xs 0
  where loop [] acc = acc
        loop (_:ys) acc = loop ys $ acc + 1

myLength'' :: [a] -> Int
myLength'' xs = foldl (\ acc _ -> acc + 1) 0 xs

myLength''' :: [a] -> Int
myLength''' = sum . map (\_ -> 1)
