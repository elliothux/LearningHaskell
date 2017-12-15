
-- 模式匹配
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

-- 叠加二维向量
-- 不使用模式匹配
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)
-- 使用模式匹配
addVectors' :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)



main = do
    print (sayMe 1)
    print (sayMe 10)
    print (factorial 10)
    print (addVectors' (1, 2) (3, 4))
