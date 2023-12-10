module ProblemFive where

getSolution :: Integer
getSolution = head $ filter (\x -> isDivisibleByAll x [1..20]) [20,40..]


isDivisibleBy :: Integral a => a -> a -> Bool
isDivisibleBy num byNum =
  num `mod` byNum == 0

isDivisibleByAll :: (Foldable t, Integral a) => a -> t a -> Bool
isDivisibleByAll num = all (isDivisibleBy num)