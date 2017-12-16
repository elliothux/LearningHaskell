
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximun of empty list"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)

replicate' :: Int -> a -> [a]
replicate' n x
    | n <=0 = []
    | otherwise = x:replicate' (n-1) x

take' :: Int -> [a] -> [a]
take' n _ | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x:take' (n-1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' x = x:repeat' x

zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x, y):zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
a `elem'` [] = False
a `elem'` (x:xs)
    | a == x = True
    | otherwise = a `elem'` xs

quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) =
    let smallerOrEqual = [a | a <- xs, a <= x]
        larger = [a | a <- xs, a > x]
    in quickSort smallerOrEqual ++ [x] ++ quickSort larger



main = do
    print (maximum' [1, 2, 3, 4])       -- 4
    print (maximum' "Aloha!")           -- o
    print (replicate' 3 5)              -- [5, 5, 5]
    print (take 2 [3, 4, 5])            -- [3, 4]
    print (reverse' "Hello!")           -- "!olleH"
    print (take' 3 (repeat' 2))         -- [2, 2, 2]
    print (zip' [1..4] "abc")           -- [(1, a), (2, b), (3, c)]
    print ('a' `elem'` "Happy")         -- True
    print (quickSort [9, 2, 7, 1, 5])   -- [1, 2, 5, 7, 9]

