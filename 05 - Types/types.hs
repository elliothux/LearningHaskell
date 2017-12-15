
-- Basic Types

-- Int 表示整数，范围是 -2147483648 ~ -2147483648 (32 位)
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- Integer 也表示整数，但它是无界的, 其效率不如 Int
factorial :: Integer -> Integer
factorial n = product [1 .. n]

-- Float 表示单精度的浮点数
circumference :: Float -> Float
circumference r = 2 * pi * r

-- Double 表示双精度的浮点数
circumference' :: Float -> Float
circumference' r = 2 * pi * r

-- Bool 表示布尔值，它只有两种值：True 和 False

-- Char 表示一个字元。一个字元由单引号括起
-- 一组字元的 List 即为字串
removeNoeUppercase :: [Char] -> [Char]
removeNoeUppercase st = [c | c <- st, c `elem` ['A' .. 'Z']]



main = do
    print (removeNoeUppercase "HelloWorld")
    print (addThree 1 2 3)
    print (factorial 50)
    print (circumference 10)
    print (circumference' 10)

    -- TypeClasses

    -- Eq 包含可判断相等性的型别, 提供实现的函数是 == 和 /=

    -- Ord 包含可比较大小的型别, 包含了<, >, <=, >= 之类用于比较大小的函数

    -- Show 的成员为可用字串表示的型别, 最常用的函数表示 show 它可以取任一 Show 的成员型别并将其转为字串
    print (show True)       -- "True"

    -- Read 是与 Show 相反的 Typeclass, read 函数可以将一个字串转为 Read 的某成员型别
    -- 调用 read 时必须使 Haskell 能够推断出返回值的类型, 否则需要指出其返回值的类型
    print (read "3.14" :: Float)    -- 3.14
    print (read "True" || odd 10)   -- True

    -- Enum 的成员都是连续的型别, 也就是可枚举
    -- 每个值都有后继子 (successer) 和前置子 (predecesor)，分别可以通过 succ 函数和 pred 函数得到
    -- 该 Typeclass 包含的型别有：(), Bool, Char, Ordering, Int, Integer, Float 和 Double
    print (pred 'B')        -- A

    -- Bounded 的成员都有一个上限和下限
    print (minBound :: Int)     -- -9223372036854775808
    print (maxBound :: (Bool, Int, Char))   -- (True,9223372036854775807,'\1114111')

    -- Num 是表示数字的 Typeclass
    -- Integral 同样是表示数字的 Typeclass, 其中的成员型别有 Int 和 Integer
    -- Floating 仅包含浮点型别 Float 和 Double
    -- fromIntegral 取一个整数做参数并回传一个更加通用的数字
    print (fromIntegral (length [1, 2, 3, 4]) + 3.1)    -- 7.1
