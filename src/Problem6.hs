module Problem6 where


getSolution :: Integer
getSolution = abs (squareNumSum 100 - sumSquared 100)


squareNumSum :: (Num a, Enum a) => a -> a
squareNumSum untilNum = sum (map  (^(2 :: Integer)) [1..untilNum])


sumSquared :: (Num a, Enum a) => a -> a
sumSquared untilNum = sum [1..untilNum] ^ (2 :: Integer)







