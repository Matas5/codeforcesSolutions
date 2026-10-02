main = do 
    input <- getLine
    let input2 = stringToInt input
    if input2 < 3 then
        putStrLn "NO"
        else if (mod input2 2) /= 0 then
            putStrLn "NO"
        else 
            putStrLn "YES"

stringToInt :: String -> Int
stringToInt s = read s