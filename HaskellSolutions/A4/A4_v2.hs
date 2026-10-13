main = do
    input <- getLine
    if (stringToInt input) < 3 then
        putStrLn "NO"
        else if (mod (stringToInt input) 2) /= 0 then
            putStrLn "NO"
        else
            putStrLn "YES"

stringToInt :: String -> Int
stringToInt s = read s
