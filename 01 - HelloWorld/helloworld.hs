
main = do
    -- Hello World
    putStrLn "Hello World!"
    name <- getLine
    putStrLn ("Hey " ++ name ++ "!")

    -- Base Calc
    print (1 + 2)           -- 3
    print (23 * 45)         -- 1035
    print (31 / 4)          -- 7.75
    print (50 * 100 - 20)   -- 4980
    print (50 * (20 - 100)) -- -4000
    print (8 + 2.6)         -- 10.6

    -- Boolean
    print (True && False)   -- False
    print (False || True)   -- True
    print (not (False || True))     -- False

    -- Equal
    print (2 == 2)          -- True
    print (1 == 0)          -- False
    print (5 /= 5)          -- False
    print (5 /= 4)          -- True
    print ("Hello" == "World")      -- False

    -- Function Call
    -- 中缀函数
    print (1 + 2)           -- 3
    print (2 * 3)           -- 6
    -- 前缀函数
    print (succ 10)         -- 11
    print (min 3 4)         -- 3
    print (max 90 89.9)     -- 90.0
    -- 函数调用的优先级最高
    print (succ 9 + max 5 4 + 1)        -- 16
    print ((succ 9) + (max 5 4) + 1)    -- 16

    print (doubleMe 10)                     -- 20
    print (doubleUs 10.25 20.25)            -- 61.0
    print (doubleSmallNumber 30)            -- 60
    print (doubleSmallNumberAndPlusOne 30)  -- 61


-- Function Declaration
doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100 then  x else x * 2
-- Haskell 中的 If 语句是表达式
doubleSmallNumberAndPlusOne x = (if x > 100 then x else x * 2) + 1
-- 这是一个返回字符串的函数! 并且 conanO'Brien 不可修改
conanO'Brien = "It's a-me, Conan O'Brien!"
