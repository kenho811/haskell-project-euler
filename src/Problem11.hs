
module Problem11 where

import qualified Data.Map as Map
import Data.Maybe (catMaybes)


type Coordinate = (Int,Int)

-- 89, 94, 97, 87
-- (12, 6)


runProblem11 :: IO()
runProblem11 = do
    content <- getInputFromFile
    let dataMap = getNumsFromString content
    let coordinates = [(x,y) | x <- [0..19], y <- [0..19]]
    -- print coordinates
    -- print $ map (\ (x,y) -> ((x,y), maxAtCoordinate dataMap (x,y))) coordinates
    print $ maximum $ map (\ (x,y) -> maxAtCoordinate dataMap (x,y)) coordinates
    -- print $ maxAtCoordinate dataMap (12,6)


-- read and parse input
getInputFromFile :: IO String
getInputFromFile = readFile "files/Problem11.txt"


getNumsFromString :: String -> Map.Map Coordinate Int
getNumsFromString str = Map.fromList [ ((rolNum, colNum), word) | (line, rolNum) <- zip (lines str) [0..],  (word, colNum) <- zip (map read $ words line) [0..] ]

filterCoordinate :: Coordinate -> Bool
filterCoordinate (x, y) = x >=0 && y>=0 && x<=19 && y<=19

mayBeProduct :: [Maybe Int] -> Maybe Int
mayBeProduct xs | length xs /= length (catMaybes xs) = Nothing
                | otherwise = (Just . product . catMaybes) xs

    
maxAtCoordinate :: Map.Map Coordinate Int -> Coordinate -> Maybe Int
maxAtCoordinate hashMap (rolNum, colNum) =  
    let right = filter filterCoordinate  $ zip (replicate 4 rolNum) (map (colNum+) [0..3])
        left = filter filterCoordinate  $ zip (replicate 4 rolNum) (map (colNum-) [0..3])
        up = filter filterCoordinate  $ zip (map (rolNum-) [0..3]) (replicate 4 colNum)
        down = filter filterCoordinate  $ zip (map (rolNum+) [0..3]) (replicate 4 colNum)
        rightUp = filter filterCoordinate  $ zip (map (rolNum-) [0..3]) (map (colNum+) [0..3])
        rightDown = filter filterCoordinate  $ zip (map (rolNum+) [0..3]) (map (colNum+) [0..3])
        leftUp = filter filterCoordinate  $ zip (map (rolNum-) [0..3]) (map (colNum-) [0..3])
        leftDown = filter filterCoordinate  $ zip (map (rolNum+) [0..3]) (map (colNum-) [0..3])
        -- all the values
        rightProduct = mayBeProduct $ map (\(x,y) -> Map.lookup (x, y) hashMap) right
        leftProduct = mayBeProduct $ map (\(x,y) -> Map.lookup (x, y) hashMap) left
        upProduct = mayBeProduct $ map (\(x,y) -> Map.lookup (x, y) hashMap) up
        downProduct = mayBeProduct $ map (\(x,y) -> Map.lookup (x, y) hashMap) down
        rightUpProduct = mayBeProduct $ map (\(x,y) -> Map.lookup (x, y) hashMap) rightUp
        rightDownProduct = mayBeProduct $ map (\(x,y) -> Map.lookup (x, y) hashMap) rightDown
        leftUpProduct = mayBeProduct $ map (\(x,y) -> Map.lookup (x, y) hashMap) leftUp
        leftDownProduct = mayBeProduct $ map (\(x,y) -> Map.lookup (x, y) hashMap) leftDown
    in
       maximum [rightProduct, leftProduct, upProduct, downProduct, rightUpProduct, rightDownProduct, leftUpProduct, leftDownProduct]
