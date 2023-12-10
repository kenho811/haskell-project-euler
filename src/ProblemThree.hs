module ProblemThree where


getSolution :: (Integer, [Integer])
getSolution = divideNumAll (600851475143, []) 1


isPrime :: (Integral a) => a -> Bool
isPrime n
  | n <= 1 = False
  | otherwise = all (\x -> n `mod` x /= 0) [2 .. floor (sqrt (fromIntegral n))]

-- Function to generate a list of prime numbers
primeNumbers :: Integer -> [Integer]
primeNumbers fromNum = filter isPrime [fromNum ..]



divideNumAll :: (Integer, [Integer]) -> Integer -> (Integer, [Integer])
divideNumAll (num, xs) startNum 
  | num' >= startNum && (length xs' > length xs) =  divideNumAll (num', xs') startNum  -- can divide
  | num' >= startNum && (length xs' == length xs) =  divideNumAll (num', xs') $ startNum + 1   -- can divide
  | otherwise = (num', xs') -- end algo
  where (num', xs') = divideNumStep (num, xs) startNum



divideNumStep :: (Integer, [Integer]) -> Integer -> (Integer, [Integer])
divideNumStep (num, xs) startNum =
  let checkPrime = head $ primeNumbers startNum
  in case num `mod` checkPrime of
    0 -> (num `div` checkPrime, checkPrime : xs)
    _ -> (num, xs)


