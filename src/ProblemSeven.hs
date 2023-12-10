module ProblemSeven where


getSolution :: Integer
getSolution = filter isPrime [1..] !!10000


isPrime :: Integral a => a -> Bool
isPrime num
    | num <= 1 = False
    | otherwise = all (\x -> num `mod` x /= 0 ) [2.. floor ( sqrt (fromIntegral num))]

