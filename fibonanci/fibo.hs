fibonacci :: Int -> Int
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = fibonacci (n-2) + fibonacci (n-1)

main :: IO ()
main = do
    let result = show $ fibonacci 3
    putStrLn result
