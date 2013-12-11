import Data.List

data Encoded a = Multiple Int a | Single a deriving Show

encodeModified :: Eq a => [a] -> [Encoded a]
encodeModified xs = map (\ys -> process (length ys, head ys)) $ group xs
  where process (1, x) = Single x
        process (n, x) = Multiple n x
