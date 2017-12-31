
main = do
    -- Function Application
    -- Haskell 中普通的函数调用有最高的优先顺序, 而 $ 的优先顺序则最低
    -- 用空格的函数调用是左结合的, 而 $ 则是右结合的

    -- 可以把$看作是在右面写一对括号的等价形式
    -- let a = sum (map sqrt [1..10])
    let a = sum $ map sqrt [1..10]
    print a

    -- $ 还可以将数据作为函数使用
    let b = map ($ 5) [(3 *), (+ 6), sqrt]
    print b


    -- Function Composition
    -- f . g = \x -> f (g x)
    -- 如, 有一组由数字组成的 List, 要将其全部转为负数:
    -- let c = map (\x -> negate (abs x)) [1, -2, 3, -4]
    let c = map (negate . abs) [1, -2, 3, -4]
    print c

    -- 对含多个参数的函数该怎么办, 可以使用不全调用
    let d = sum . replicate 5 . max 8 $ 3 * 3
    print d

    -- 求小于 10000 的所有(奇数平方)的和
    let oddSquareSum = sum . takeWhile (<1000) . filter odd . map (^2) $ [1..]
    print oddSquareSum
