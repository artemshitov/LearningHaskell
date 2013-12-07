elementAt :: [a] -> Int -> Maybe a
elementAt (x:xs) 1 = Just x
elementAt (_:xs) k = elementAt xs $ k - 1
elementAt [] _ = Nothing
