import Data.List
import System.IO
import System.Environment

data Cell      = Empty | Filled deriving (Eq, Show)
type Row       = [Cell]
type Rows      = [Row]
type Problem   = Int
type Problems  = [Problem]

class Renderable a where
  render :: a -> String

instance Renderable Cell where
  render Empty  = "."
  render Filled = "+"

renderRow :: Row -> String
renderRow xs = intersperse ' ' $ concatMap render xs

--

isFilled :: Cell -> Bool
isFilled = (== Filled)

isEmpty :: Cell -> Bool
isEmpty = (== Empty)

mkRows :: Int -> Rows
mkRows 0 = [[]]
mkRows n = [x:xs | x <- [Filled, Empty], xs <- mkRows $ n-1]

isLegal :: Problems -> Row -> Bool
isLegal ps xs = length ps == length fs &&
                      all (\(p, fs') -> p == length fs') (zip ps fs)
  where fs = filter (isFilled . head) (group xs)

legalRows :: Problems -> Rows -> Rows
legalRows ps = filter $ isLegal ps

solutionsForRow :: Int -> Problems -> Rows
solutionsForRow size ps = legalRows ps $ mkRows size

solutions :: [Problems] -> [Rows]
solutions ps = map (solutionsForRow size) ps
  where size = length ps

boards :: [Rows] -> [Rows]
boards = sequence

isLegalBoard :: [Problems] -> Rows -> Bool
isLegalBoard ps rs = all (uncurry isLegal) (zip ps (transpose rs))

findSolution :: [Problems] -> [Rows] -> Maybe Rows
findSolution ps = find (isLegalBoard ps)

solve :: [Problems] -> [Problems] -> Maybe Rows
solve hps vps = findSolution vps $ boards $ solutions hps

--

decodePuzzle :: String -> ([Problems], [Problems])
decodePuzzle p = splitAt (length allPs `div` 2) allPs
  where allPs = map (map (\w -> read w :: Int) . words) (lines p)

main = do
  (input:_) <- getArgs
  puzzle <- readFile input
  let (hps, vps) = decodePuzzle puzzle
  case solve hps vps of
    Just rs -> putStrLn (unlines (map renderRow rs))
    Nothing -> putStrLn "No solution"
