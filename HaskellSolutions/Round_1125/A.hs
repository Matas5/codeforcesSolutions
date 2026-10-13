-- time it took me to do the code:
import Data.Char (digitToInt, intToDigit)

main = do
  input <- getLine
  inputLines <- readMultipleLines (myStringToInt input)
  --putStrLn (joinStrings inputLines)
  writeOutput inputLines

myInputLines :: [String]
myInputLines = ["10 10 13", "5 5 5", "0 0 1"]

readMultipleLines :: Int -> IO [String]
readMultipleLines a = readMultipleLines' a [] where
  readMultipleLines' 0 acc = do return (acc)
  readMultipleLines' a acc = do
    input <- getLine
    readMultipleLines' (a-1) (input:acc)

myStringToInt :: String -> Int
myStringToInt s = read s

myFunction1 :: [String] -> (Int, Int, Int)
myFunction1 (s:s2:s3:t) = (read s, read s2, read s3)

joinStrings :: [String] -> String
joinStrings [] = ""
joinStrings (h:t) = h ++ " " ++ (joinStrings t)

-- ##############################

parseToTuple2 :: [String] -> [(Int, Int, Int)]
parseToTuple2 [] = []
parseToTuple2 (h:t) = [parseToTuple h] ++ (parseToTuple2 t)

parseToTuple :: String -> (Int, Int, Int)
parseToTuple [] = (0,0,0)
parseToTuple a = myFunction1 (words a)

findSuitablePoint :: [(Int, Int, Int)] -> [(Int, Int)]
findSuitablePoint [] = []
findSuitablePoint ((x,y,r): t) = [((x+r), y)] ++ (findSuitablePoint t)

convertAnswerToString :: [(Int, Int)] -> String
convertAnswerToString [] = ""
convertAnswerToString ((a, b):t) =  convertAnswerToString t ++ "\n" ++ (show a)++ " " ++ (show b)

writeOutput :: [String] -> IO ()
writeOutput [] = return ()
writeOutput a = putStrLn (convertAnswerToString (findSuitablePoint (parseToTuple2 a)))
