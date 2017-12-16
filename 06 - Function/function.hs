
-- Pattern matching
-- 在定义函数时，可以为不同的模式分别定义函数本身
sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * (factorial (n - 1))


-- 元组的模式匹配
-- 叠加二维向量, 不使用模式匹配
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)
-- 使用模式匹配
addVectors' :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- 匹配三元组
-- 使用 "_" 占位符
first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z


-- 列表与列表推导式的模式匹配
-- 叠加向量的坐标
addVectorsXY :: (Num a) => [(a, a)] -> [a]
addVectorsXY vs = [x + y | (x, y) <- vs]

-- 使用 "[]" 匹配空列表, 使用 "x:xs" 匹配非空列表
tell :: (Show a) => [a] -> String
tell [] = "The list is empty!"
tell (x:[]) = "This list has one element: " ++ show x
tell (x:y:[]) = "This list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list has more than two elements: " ++ show x ++ ", " ++ show y ++ " ..."

-- 使用 "As Pattern" 访问 "x:xs" 中的整个列表
firstLetter :: String -> String
firstLetter "" = "Empty string!"
firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]



-- Guard
-- Pattern 用来检查参数的结构是否正确, Guard 用来检查参数的性质是否为 True
compare' :: (Ord a) => a -> a -> Ordering
a `compare'` b
    | a == b = EQ
    | a < b = LT
    | otherwise = GT

-- 使用 where 语句保存计算的中间结果
bmiTell :: Double -> Double -> String
bmiTell weight height
    | bmi <= skinny = "You'r underweight!"
    | bmi <= normal = "You'r supposedly normal!"
    | bmi <= fat = "You'r fat!"
    | otherwise = "You'r a whale!"
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.0
          fat = 30.0
          -- where 中也可使用模式匹配
          -- (skinny, normal, fat) = (18.5, 25.0, 30.0)

-- where 中可使用块函数
calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2



-- let 表达式 (let <Binding> in <Expressions>)
cylinder :: Double -> Double -> Double
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r^2
    in sideArea + 2 * topArea

squares :: [Double] -> [Double]
squares xs = let square x = x * x in [square x | x <- xs]



main = do
    print (sayMe 1)         -- "One"
    print (sayMe 10)        -- "Not between 1 and 5"
    print (factorial 10)    -- 3628800
    print (addVectors' (1, 2) (3, 4))   -- (4, 6)
    print (third (1, 2, 3))             -- 3
    print (addVectorsXY [(1, 2), (3, 4), (5, 6)])   -- [3, 7, 11]
    print (tell [1, 2, 3])
    print (firstLetter "Hello")     -- 'H'
    print (1 `compare` 3)           -- LT
    print (bmiTell 70 1.78)
    print (bmiTell 90 1.8)
    print (calcBmis [(80, 1.8), (50, 1.6), (100, 1.85)])
    print (cylinder 3 5)
    print (squares [1.0, 2.0, 3.0])
