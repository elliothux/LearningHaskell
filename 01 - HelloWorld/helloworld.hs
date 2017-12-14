
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



-- Function Declaration
doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y

-- print doubleMe 10
