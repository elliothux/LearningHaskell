
-- Haskell 中的所有函数都为一元函数
-- 如: max 4 5 可以看做 (max 4) 5

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

-- 通过以少数参数调用函数来创建新函数
multTwoWithNine = multThree 9

compareWithHundred :: Int -> Ordering
compareWithHundred x = x `compare` 100



main = do
    print (multThree 1 2 3)         -- 6
    print (multTwoWithNine 2 3)     -- 54
    print (compareWithHundred 101)  -- GT
