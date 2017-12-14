
main = do
    -- List 可以用来存储多个类型相同的元素
    let numbers = [1, 2, 3, 4]
    print (numbers)

    -- 合并 List
    print ([1, 2, 3, 4] ++ [5, 6, 7, 8])    -- [1, 2, 3, 4, 5, 6, 7, 8]
    -- Haskell 中字串实际上就是一组字元的 List
    -- 如 "Hello" 只是 ['h','e','l','l','o'] 的语法糖
    -- 因此我们可以使用处理 List 的函数来对字串进行操作
    print ("hello " ++ "world")         -- "hello world"

    -- 使用 ++ 运算子时 Haskell 会遍历整个 List
    -- 使用 : 运算子可以往一个 List 前端插入元素
    -- Haskell 中 [1,2,3] 实际上是 1:2:3:[] 的语法糖
    print (1:[2, 3, 4])     -- [1, 2, 3, 4]

    -- 使用 !! 按照索引取得 List 中的元素
    print ([8.9, 7.2, 3.5] !! 2)    -- 3.5
    print ([[1, 2, 3], [4, 5, 6]] !! 1 !! 2)    -- 6

    -- 当 List 内装有可比较的元素时，使用 > 和 >= 可以比较 List 的大小。它会先比较第一个元素，若它们的值相等，则比较下一个，以此类推。
    print ([3, 2, 1] > [2, 1, 0])   -- True
    print ([0, 1, 2] > [2, 1, 0])   -- False
    print ([2, 3, 4] > [2, 3])      -- True
    print ([2, 3, 4] > [3, 4])      -- False

    -- 常用函数
    -- head 返回 List 的首个元素
    print (head [2, 3, 4])      -- 2
    -- tail 返回 List 除去头部之后的部分
    print (tail [2, 3, 4])      -- [3, 4]
    -- last 返回一个 List 的最后一个元素
    print (last [2, 3, 4])      -- 4
    -- init 返回一个 List 除去最后一个元素的部分
    print (init [2, 3, 4])      -- [2, 3]
    -- length 返回一个 List 的长度
    print (length [1, 2, 3])    -- 3
    -- null 检查一个 List 是否为空
    print (null [])             -- True
    print (null [1, 2, 3])      -- False
    -- reverse 将一个 List 反转
    print (reverse [1, 2, 3])   -- [3, 2, 1]
    -- take 返回一个 List 的前几个元素
    print (take 2 [2, 3, 4])    -- [2, 3]
    print (take 5 [2, 3, 4])    -- [2, 3, 4]
    -- drop 删除一个 List 中的前几个元素
    print (drop 2 [2, 3, 4])    -- [4]
    print (drop 5 [2, 3, 4])    -- []
    -- maximum 返回一个 List 中最大的元素, minimun 返回最小的元素
    print (minimum [8, 4, 2, 1, 5, 6])      -- 1
    print (maximum [8, 4, 2, 1, 5, 6])      -- 8
    -- sum 返回一个 List 中所有元素的和, product 返回一个 List 中所有元素的积
    print (sum [1, 2, 3, 4])        -- 10
    print (product [1, 2, 3, 4])    -- 24
    -- elem 判断一个元素是否在包含于一个 List
    print (elem 4 [1, 2, 3, 4])     -- True
    print (4 `elem` [1, 2, 3, 4])   -- True
