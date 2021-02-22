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

surface :: [(Double, Double)] -> Double
surface xs = edge xs + traversal xs

--- see more https://www.mathopenref.com/coordpolygonarea.html
--- area of irregular polygon
crossMultiply :: (Double, Double) -> (Double, Double) -> Double
crossMultiply x1 x2 = (fst x1 * snd x2) - (snd x1 * fst x2)

traversalArea :: [(Double, Double)] -> Double
traversalArea [x1] = 0
traversalArea (x1:x2:xs) = crossMultiply x1 x2 + traversalArea (x2:xs)

edgeArea :: [(Double, Double)] -> Double
edgeArea xs = crossMultiply (last xs) (head xs) 

area :: [(Double, Double)] -> Double
area xs = abs (edgeArea xs + traversalArea xs) / 2

main = do 
    contents <- readFile("testcase.txt")
    let inputs = map read . words $ contents
    let result = show . area . tuplify . map fromIntegral . tail $ inputs
    putStrLn result