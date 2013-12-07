import Data.List

encode :: Eq a => [a] -> [(Int, a)]
encode xs = map (\ys -> (length ys, head ys)) $ group xs
