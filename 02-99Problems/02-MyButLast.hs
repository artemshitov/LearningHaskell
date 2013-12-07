myButLast :: [a] -> Maybe a
myButLast (x : x' : []) = Just x
myButLast (x : xs) = myButLast xs
myButLast _ = Nothing
