module Problem10 where


getSolution :: Integer
getSolution = sum (filter isPrime [1..2000000])


isPrime :: Integral a => a -> Bool
isPrime num
    | num <= 1 = False
    | otherwise = all (\x -> num `mod` x /= 0 ) [2.. floor ( sqrt (fromIntegral num))]



