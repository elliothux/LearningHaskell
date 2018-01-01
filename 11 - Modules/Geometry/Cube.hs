
-- 创建子模块
module Geometry.Cube (
    volume,
    area
) where


-- 导入子模块
import qualified Geometry.Cuboid as Cuboid


volume :: Float -> Float
volume side = Cuboid.volume side side side

area :: Float -> Float
area side = Cuboid.area side side side
