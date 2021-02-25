## Pascal's Triangle

https://www.hackerrank.com/challenges/pascals-triangle/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

solving
```
_ | 0 | 1 | 2 | 3 | ... | r
0 | 1 |   |   |   | ... | r 
1 | 1 | 1 |   |   | ... | r 
2 | 1 | 2 | 1 |   | ... | r 
3 | 1 | 3 | 3 | 1 | ... | r 
. | . | . | . | . | ... | r 
. | . | . | . | . | ... | r 
n |   |   |   |   | ... | r 
```

to find the value in each (row, column) using this for mular
combination (n, r) = n! / r! * (n - r)!

for example
(2,1) = 2! / 1! * (2 - 1)! = 2
(1,0) = 1! / 1! * (1 - 1)! = 1

Step
1. input K
2. generate tuple 
```
[
    [(k-1, k-1),(k-1, k-2),(k-1, k-3)...(k-1, 0)],
    [(k-2, k-2-1), (k-2, k-2-2)...(k-2, 0)],
    ...,
    [(0,0)]
]
```
for example K = 4
```
[
    [(3,3),(3,2),(3,1),(3, 0)],
    [(2,2),(2,1),(2,0)],
    [(1,1),(1,0)],
    [(0,0)]
]
```
3. iterate each array to take combination formular
4. result will be
```
[
    [1,3,3,1],
    [1,2,1],
    [1,1],
    [1]
]
```
5. reverse and print to string