import Debug.Trace
import Data.List

intToString :: [Int] -> [String]
intToString = (>>= return.show)

factorial :: (Num a, Enum a) => a -> a
factorial n = product [1..n]

col :: Int -> [Int]
col 0 = [0]
col y = y : col (y-1)

row :: Int -> [[(Int,Int)]]
row k = [map (\x -> (k, x)) (reverse $col k)]

tuplify :: Int -> [[(Int, Int)]]
tuplify 0 = []
tuplify k = row (k-1) ++ tuplify (k-1)

combination :: (Int, Int) -> Int
combination x = factorial n `div` (factorial r * factorial (n - r))
            where n = fst x
                  r = snd x

solve :: Int -> [[Int]]
solve x = map (map combination) (reverse $ tuplify x)

main :: IO ()
main = do
    let result = unlines $ map (unwords . intToString) $ solve 4
    putStrLn result
