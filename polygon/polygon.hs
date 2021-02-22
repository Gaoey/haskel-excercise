import Data.List
import Debug.Trace

tuplify :: [a] -> [(a, a)]
tuplify [] = []
tuplify (x:y:xs) = (x,y): tuplify xs

distance :: (Double, Double) -> (Double, Double) -> Double
distance x1 x2 = sqrt (((fst x2 - fst x1)**2) + ((snd x2 - snd x1)**2))

traversal :: [(Double, Double)] -> Double
traversal [x1] = 0
traversal (x1:x2:xs) = distance x1 x2 + traversal (x2:xs)

edge :: [(Double, Double)] -> Double
edge xs = distance (head xs) (last xs)

solve :: [(Double, Double)] -> Double
solve xs = edge xs + traversal xs

main = do 
    contents <- readFile("testcase.txt")
    let inputs = map read . words $ contents
    let result = show . solve . tuplify . map fromIntegral . tail $ inputs
    putStrLn result