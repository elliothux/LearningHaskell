
-- Lambda 就是一次性的匿名函数
-- 格式为: \args -> expression, 如:
nums1 :: [Int]
nums1 = filter (\x -> x `mod` 3 == 0) [20..30]

-- lambda 中也可使用模式匹配
-- 一 一旦 Lambda 模式匹配失败就会引发 Runtime Error
nums2 = map (\(a, b) -> a + b) [(1, 2), (3, 4), (5, 6)]

flip' :: (a -> b -> c) -> b -> a -> c
-- flip' f x y = f y x
flip' f = \x y -> f y x


-- Fold Functions
-- 所有遍历列表中的元素并据此返回一个值的操作都可以基于折叠实现
-- 一个折叠取一个二元函数、一个初始值以及一个待折叠的列表
-- 从左端开始的折叠称为左折叠, 从右端开始的折叠称为右折叠
-- 左折叠无法处理无限列表, 而右折叠可以

sum' :: (Num a) => [a] -> a
-- sum' xs = foldl (\acc x -> acc + x) 0 xs
sum' xs = foldl (+) 0 xs

map' :: (a -> b) -> [a] -> [b]
-- map' f xs = foldl (\acc x -> acc ++ [f x]) [] xs
map' f xs = foldr (\x acc -> f x : acc) [] xs

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldr (\x acc -> if x == y then True else acc) False ys

-- foldl1 与 foldr1 类似, 不过他们不需要提供初始值
maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 max

-- 使用折叠实现标准库函数
reverse' :: [a] -> [a]
-- reverse' = foldl (\acc x -> x : acc) []
reverse' = foldl (flip (:)) []

product' :: (Num a) => [a] -> a
product' = foldl1 (*)

filter' :: (a -> Bool) -> [a] -> [a]
filter' f = foldr (\x acc -> if f x then x:acc else acc) []

last' :: [a] -> a
last' = foldr1 (\_ x -> x)

-- 无限列表的折叠
and' :: [Bool] -> Bool
and' xs = foldr (&&) True xs

-- Scan
-- scanl 和 scanr 与 foldl 与 foldr 相似
-- 不过它会将累加值的过程存储到一个列表中
list0 = scanl (+) 0 [1, 2, 3, 4]
list1 = scanr (+) 0 [1, 2, 3, 4]

-- scanl1 和 scanr1 与 foldl1 与 foldr1 类似
scanMax :: (Ord a) => [a] -> [a]
scanMax = scanl1 (\acc x -> if x > acc then x else acc)

-- 将自然数的平方和依次相加, 会在何时超过 1000?
sqrtNums :: Integer
sqrtNums = takeWhile (<1000) (scanl1 (+) [x^2 | x <- [0..]])




main = do
    print (nums1)           -- [21,24,27,30]
    print (nums2)           -- [3, 7, 11]
    print (flip' (-) 2 8)   -- 6
    print (sum' [8, 9, 6])  -- 23
    print (map' (*2) [2, 3, 4])     -- [4, 6, 8]
    print (elem' 'a' "Aloha")       -- True
    print (maximum' [-3, 7, 9, 5])  -- 9
    print (reverse' "Hello")        -- "olleH"
    print (product' [1, 2, 3])      -- 6
    print (filter' even [2, 3, 4])  -- [2, 4]
    print (last' "Hello!")          -- '!'
    print (and' (repeat False))     -- False
    print (list0)                   -- [0,1,3,6,10]
    print (list1)                   -- [10,9,7,4,0]
    print (scanMax [4, 1, 8, 22, 9])-- [4,4,8,22,22]
    print (sqrtNums)