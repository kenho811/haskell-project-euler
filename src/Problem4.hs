module Problem4 where


getSolution :: Integer
getSolution = maximum $ filter isNumPalindrom prod


prod :: [Integer]
prod = [x*y | x <- [999, 998.. 1], y <- [999,998..1]]


isNumPalindrom :: Integer -> Bool
isNumPalindrom num =
  show num == (reverse . show) num




