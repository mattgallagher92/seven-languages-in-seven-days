quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (h:t) =
    (quicksort smaller) ++ [h] ++ (quicksort bigger)
    where
        smaller = filter (< h) t
        bigger = filter (>= h) t

quicksortWith :: (a -> a -> Bool) -> [a] -> [a]
quicksortWith _ [] = []
quicksortWith firstIsSmaller (h:t) =
    (quicksortWith firstIsSmaller smaller) ++ [h] ++ (quicksortWith firstIsSmaller bigger)
    where
        smaller = filter (\x -> firstIsSmaller x h) t
        bigger = filter (\x -> not (firstIsSmaller x h)) t

-- Note: loss of precision due to float.
parseDollarAmount :: String -> Float
parseDollarAmount s = (read . filter (/= '$') . filter (/= ',')) s

everyThirdFrom x = x:everyThirdFrom (x+3)
everyFifthFrom y = y:everyFifthFrom (y+5)
-- The problem says to "combine" everyThirdFrom and everyFifthFrom "through composition", but their types don't compose.
-- I assume that the language is being used loosely.
everyEighthFromSumOf x y = zipWith (+) (everyThirdFrom x) (everyFifthFrom y)

half = flip (/) 
appendNewline = flip (++) "\n"

-- TODO: more demanding problems.
