{-# LANGUAGE QuasiQuotes #-}

module Problem11 where


runProblem11 :: IO()
runProblem11 = do
    content <- getInputFromFile
    print (getNumsFromString content)


getInputFromFile :: IO String
getInputFromFile = readFile "files/Problem11.txt"


getNumsFromString :: String -> [[Int]]
getNumsFromString = map (map read . words) . lines