module Problem12 where


runProblem12 :: Integer
runProblem12 = head $ filter (\x -> length(getFactorsOf x) >=500 ) $ map getTriangularNum [1..]




getFactorsOf :: Integral a => a -> [a]
getFactorsOf n = [ x | x <- [1..n], n `mod` x == 0]


getTriangularNum :: Int -> Integer
getTriangularNum = (map getTriangularNum' [1..] !!)
    where getTriangularNum' 1 = 1
          getTriangularNum' n = n + getTriangularNum' n -1 