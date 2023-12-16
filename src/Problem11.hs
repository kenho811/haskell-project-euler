
module Problem11 where

import qualified Data.Map as Map
import Data.Maybe (catMaybes)


type Coordinate = (Int,Int)


runProblem11 :: IO()
runProblem11 = do
    content <- getInputFromFile
    let dataMap = getNumsFromString content
    print $ Map.lookup (0, 0) dataMap


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
    let rightHorizontal = filter filterCoordinate  $ zip (replicate 3 rolNum) (map (colNum+) [0..3])
        leftHorizontal = filter filterCoordinate  $ zip (replicate 3 rolNum) (map (colNum-) [0..3])
        rightDown = filter filterCoordinate  $ zip (map (rolNum+) [0..3]) (map (colNum+) [0..3])
        leftUp = filter filterCoordinate  $ zip (map (rolNum-) [0..3]) (map (colNum-) [0..3])
        -- all the values
        rightHorizontalProduct = mayBeProduct $ map (\(x,y) -> Map.lookup (x, y) hashMap) rightHorizontal
        leftHorizontalProduct = mayBeProduct $ map (\(x,y) -> Map.lookup (x, y) hashMap) leftHorizontal
        rightDownProduct = mayBeProduct $ map (\(x,y) -> Map.lookup (x, y) hashMap) rightDown
        leftUpProduct = mayBeProduct $ map (\(x,y) -> Map.lookup (x, y) hashMap) leftUp
    in
        maximum [rightHorizontalProduct, leftHorizontalProduct, rightDownProduct, leftUpProduct]
