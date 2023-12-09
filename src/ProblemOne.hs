module ProblemOne (getSolution) where

getSolution :: Integer
getSolution = getSum [1..999]

-----------------


isMultipleOfNum :: Integral a => a -> a -> Bool
isMultipleOfNum num1 num2 =
     (num1 `mod` num2) == 0


isMultipleOf3 :: Integral a => a -> Bool
isMultipleOf3 num = isMultipleOfNum num 3

isMultipleOf5 :: Integral a => a -> Bool
isMultipleOf5 num = isMultipleOfNum num 5

isMultipleOf3Or5 :: Integral a => a -> Bool
isMultipleOf3Or5 num = isMultipleOf3 num || isMultipleOf5 num

getSum :: Integral a => [a] -> a
getSum nums = sum $ filter isMultipleOf3Or5 nums


