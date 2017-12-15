
main = do
    -- Tuple 很像 List, 都是将多个值存入一个个体的容器
    -- Tuple 有固定的长度, 并且可以放入不同类型的数据类型
    -- 它的型别取决于其中项的数目与其各自的型别
    let tuple0 = (1, 2, 3)
    print (tuple0)
    let tuple1 = [(1, 2), (3, 4), (5, 6)]
    print (tuple1)
    let tuple2 = [(1, "a"), (2, "b")]
    print (tuple2)
    -- Error: 类型不匹配
    -- let tuple3 = [(1, "a"), (2, 3)]
    -- let tuple3 = [(1, 2), (2, 3, 4)]

    -- fst 返回一个 Pair 的首项
    print (fst (1, 2))      -- 1
    -- snd 返回一个 Pair 的尾项
    print (snd (1, 2))      -- 2
    -- zip 生成一组 Pair 的 List
    print (zip [1, 2, 3] ["a", "b", "c"])       -- [(1,"a"),(2,"b"),(3,"c")]
    print (zip [1 ..] ["one", "two", "three"])  -- [(1,"one"),(2,"two"),(3,"three")]

    -- 求得所有三边都小于等于 10 的且周长为 24 的直角三角形
    let triangles = [(a, b, c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]
    print (triangles)   -- [(6, 8, 10)]