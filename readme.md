## Hackerrank template
```
main = do
    interact $ show . solve . tuplify . tail . map read . words
```