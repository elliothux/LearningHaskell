
main = do
    print ([1 .. 5])        -- [1, 2, 3, 4, 5]
    print (['c' .. 'g'])    -- "cdefg"
    print (['R' .. 'U'])    -- "RST
    print ([2, 4 .. 10])    -- [2, 4, 6, 8, 10]
    -- 要得到 10 到 1 的 List，[10..1] 是不可以的
    print ([10,9 .. 1])
    -- 因为精度问题, 在 Range 中使用浮点数要格外小心
    print([0.1, 0.3 .. 1])  -- [0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]

    -- 无限 List
    print (take 5 [13, 26 ..])  -- [13,26,39,52,65]
    print ([13, 26 .. 5*13])    -- [13,26,39,52,65]
    -- cycle 接受一个 List 做参数并返回一个无限 List
    print (take 10 (cycle [1, 2, 3]))   -- [1,2,3,1,2,3,1,2,3,1]
    print (take 12 (cycle "LOL "))      -- "LOL LOL LOL "
    -- repeat 接受一个值作参数，并返回一个仅包含该值的无限 List
    print (take 10 (repeat 5))          -- [5,5,5,5,5,5,5,5,5,5]
    -- 若只是想得到包含相同元素的 List ，使用 replicate 会更简单
    print (replicate 3 10)              -- [10, 10, 10]

    -- Set Comprehension 与 Flitering
    print ([x * 3 - 1 | x <- [1 .. 5]])         -- [2,5,8,11,14]
    print ([x * 3 - 1 | x <- [1 .. 5], x > 2])  -- [8,11,14]
    print ([x | x <- [50 .. 100], x `mod` 7 == 3])  -- [52,59,66,73,80,87,94]
    print (boomBangs [7..13])       -- ["BOOM!","BOOM!","BANG!","BANG!"]

    -- 从多个 List 中取元素
    print ([x * y | x <- [2, 5, 10], y <- [8, 9]])              -- [16,18,40,45,80,90]
    print ([x * y | x <- [2, 5, 10], y <- [8, 9], x*y > 50])    -- [80,90]
    print (length' [1, 2, 3])   -- 3
    print (removeNonUppercase "Hello World!")   -- "HW"
    print (removeNastedOdd [[1, 2, 3], [4, 5, 6], [7, 8, 9]])   -- [[2],[4,6],[8]]



boomBangs xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
length' xs = sum [1 | _ <- xs]
removeNonUppercase str = [c | c <- str, c `elem` ['A' .. 'Z']]
removeNastedOdd xss = [[x | x <- xs, even x] | xs <- xss]
