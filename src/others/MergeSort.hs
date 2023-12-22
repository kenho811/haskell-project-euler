module MergeSort where


merge :: Ord a => [a] -> [a] -> [a]
merge (x:xs) (y:ys) | x > y = y:merge (x:xs) ys
                    | otherwise =  x :merge xs (y:ys)
merge [] ys = ys
merge xs [] = xs


halve :: [a] -> ([a], [a])
halve xs  = splitAt (length xs `div` 2) xs

mSort :: Ord a => [a] -> [a]
mSort [] =  []
mSort [x] = [x]
mSort xs = merge (mSort firstHalve) (mSort secondHalve)
         where firstHalve = fst $ halve xs
               secondHalve = snd $ halve xs 