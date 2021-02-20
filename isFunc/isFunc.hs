-- Enter your code here. Read input from STDIN. Print output to STDOUT
import Data.List
import Debug.Trace

stringToInt :: String -> Int
stringToInt a = (read a) :: Int

isFunc :: [(Int, Int)] -> Bool
isFunc xs = length result == 0 
            where
                result = filter (\x -> length x > 1) $ groupBy (\a b -> fst a == fst b && snd a /= snd b) xs

tuplify :: [Int] -> [(Int, Int)]
tuplify [] = []
tuplify (x:y:xs) = (x,y):(tuplify xs)

solve :: [Int] -> String
solve [] = []
solve xs
      | isFunc $ tuplify xs = "YES"
      | otherwise           = "NO"
        
groupx :: [Int] -> [[Int]]
groupx [] = []
groupx (x:xs) = [problem] ++ (groupx other)
            where (problem, other) = splitAt (2*x) xs

main = do
    contents <- readFile "testcase.txt"
    let inputs = map stringToInt . words $ contents
    let result = unlines . map solve . groupx . tail $ inputs
    putStrLn result

    
