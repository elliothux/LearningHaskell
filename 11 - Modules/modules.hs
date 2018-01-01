
-- 导入模块
-- import Data.List

-- 导入模块中的函数
-- import Data.List (nub, sort)

-- 导入除了某个函数之外的其他函数
-- import Data.List hiding (nub)

-- 除了 hiding, 还可以使用 qualified import 避免命名冲突
import qualified Data.Map as M
import qualified Geometry.Cuboid as Cuboid
import qualified Geometry.Sphere as Sphere
import qualified Geometry.Cube as Cube


main = do
    print (Cuboid.area 1.0 2.0 3.0)     -- 22.0
    print (Cube.volume 2)               -- 8.0
    print (Sphere.area 2)
    print (Sphere.volume 3)
