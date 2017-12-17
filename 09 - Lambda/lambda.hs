
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

sum' :: (Num a) => [a] -> a
-- sum' xs = foldl (\acc x -> acc + x) 0 xs
sum' xs = foldl (+) 0 xs

map' :: (a -> b) -> [a] -> [b]
-- map' f xs = foldl (\acc x -> acc ++ [f x]) [] xs
map' f xs = foldr (\x acc -> f x : acc) [] xs

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldr (\x acc -> if x == y then True else acc) False ys


main = do
    print (nums1)           -- [21,24,27,30]
    print (nums2)           -- [3, 7, 11]
    print (flip' (-) 2 8)   -- 6
    print (sum' [8, 9, 6])  -- 23
    print (map' (*2) [2, 3, 4])     -- [4, 6, 8]
    print (elem' 'a' "Aloha")       -- True

