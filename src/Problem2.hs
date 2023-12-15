module Problem2 where

getSolution :: Integer
getSolution = sum $ fiboSeriesLessThan 4000000



fibo :: (Eq t, Num t, Num a) => t -> a
fibo n | n == 0 || n == 1 = 1
       | n == 2  = 2 
       | otherwise = fibo(n-1) + fibo(n -2)


fiboSeriesLessThan :: Integral a => a -> [a]
fiboSeriesLessThan num = filter even $ takeWhile (< num) $ map fibo [1..]


