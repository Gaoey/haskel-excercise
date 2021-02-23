gcd' :: Int -> Int -> Int
gcd' a b = case b `mod` a of
            0 -> a
            _ -> gcd' (b `mod` a) a

main = do
    contents <- readFile "testcase.txt"
    let inputs = map read . words $ contents
    let a = head inputs
    let b = last inputs
    let result = show $ gcd' a b
    putStrLn result

    
