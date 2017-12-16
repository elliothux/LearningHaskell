
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


main = do
    print (maximum' [1, 2, 3, 4])   -- 4
    print (maximum' "Aloha!")       -- o
    print (replicate' 3 5)          -- [5, 5, 5]
    print (take 2 [3, 4, 5])        -- [3, 4]
    print (reverse' "Hello!")       -- "!olleH"
