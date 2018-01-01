
module Geometry.Cuboid (
    volume,
    area
) where


volume :: Float -> Float -> Float -> Float
volume a b c = rectangleArea a b * c

area :: Float -> Float -> Float -> Float
area a b c = 2 * (rectangleArea a b + rectangleArea b c + rectangleArea a c)

rectangleArea :: Float -> Float -> Float
rectangleArea a b = a * b
