
-- Haskell 中的所有函数都为一元函数
-- 如: max 4 5 可以看做 (max 4) 5

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z


-- 通过以少数参数调用函数来创建新函数
multTwoWithNine = multThree 9

compareWithHundred :: Int -> Ordering
compareWithHundred x = x `compare` 100


-- 通过截断 (Section) 也可以对中缀函数进行部分应用
divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])


-- 高阶函数的类型声明
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
-- flip' f = g
--     where g x y = f y x
flip' f x y = f y x


-- 一系列工具函数
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x = x : filter' p xs
    | otherwise = filter' p xs


-- 一些示例
-- 使用 filter' 重构快排算法
quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) =
    let smallOrEqual = filter' (<= x) xs
        larger = filter' (> x) xs
    in quickSort smallOrEqual ++ [x] ++ quickSort larger

-- 寻找 100000 以下 3829 的最大倍数
largestDivisible :: Int
largestDivisible = head (filter' p [100000, 99999..])
    where p x = x `mod` 3829 == 0

-- 求出所有小于 10000 的(奇数的平方)之和
num1 :: Int
-- num1 = sum (takeWhile (< 1000) [m | m <- [n^2 | n <- [1..]], odd m])
num1 = sum (takeWhile (< 1000) (filter' odd (map (^2) [1..])))

-- Collatz Sequence
-- 定义: 从任意自然数开始; 如果是 1 则停止; 如果是偶数, 将它除以 2; 如果是奇数, 将它乘 3 加 1;
-- 重复上述算法, 这条链无论如何都会归 1
-- 计算以 1 到 100 之间的数作为起始数求得的 Collate Chain 中长度大于 15 的个数
collatzChain :: Integer -> [Integer]
collatzChain 1 = [1]
collatzChain n
    | even n = n : collatzChain (n `div` 2)
    | odd n = n : collatzChain (n * 3 + 1)

numLongChain :: Int
numLongChain = length (filter isLong (map' collatzChain [1..100]))
    where isLong xs = length xs > 15


-- 映射带有多个参数的函数
listOfFuncs = map' (*) [1..]
num2 = (listOfFuncs !! 5) 4     -- 6 * 4



main = do
    print (multThree 1 2 3)         -- 6
    print (multTwoWithNine 2 3)     -- 54
    print (compareWithHundred 101)  -- GT
    print (divideByTen 30)          -- 3.0
    print (isUpperAlphanum 'P')     -- True
    print (applyTwice (+2) 5)       -- 9
    -- 若要对减法操作做截断, 需要写成 "subtract x" 的形式
    print (applyTwice (subtract 4) 10)      -- 2
    print (applyTwice (3:) [])      -- [3, 3]
    print (zipWith' (+) [1, 2, 3] [4, 5, 6])    -- [5, 7, 9]
    print (zipWith' (zipWith' (*)) [[1, 2, 3], [4, 5, 6], [7, 8, 9]] [[4, 5, 6], [7, 8, 9], [1, 2, 3]])
    print (zipWith' (flip' div) [2, 2..] [10, 8, 6, 4])     -- [5, 4, 3, 2]
    print (map' (+1) [1, 2, 3])    -- [2, 3, 4]
    print (filter' odd [1, 2, 3, 4])    -- [1, 3]
    print (let notNull x = not (null x) in filter' notNull [[1, 2, 3], [], [], [2, 3]])
    print (filter' (> 8) (filter' even [1..15]))    -- [10, 12, 14]
    print (largestDivisible)    -- 99554
    print (num1)                -- 5456
    print (collatzChain 10)     -- [10,5,16,8,4,2,1]
    print (numLongChain)        -- 66
    print (num2)                -- 24