
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

quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) =
    let smallOrEqual = filter' (<= x) xs
        larger = filter' (> x) xs
    in quickSort smallOrEqual ++ [x] ++ quickSort larger



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
