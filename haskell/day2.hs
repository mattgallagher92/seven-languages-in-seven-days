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

half = flip (/) 2
appendNewline = flip (++) "\n"

myGcd :: Int -> Int -> Int
myGcd a 0 = a
myGcd 0 b = b
myGcd a b = if a > b then myGcd (a `mod` b) b else myGcd a (b `mod` a)

lazyPrimes :: [Int] -> [Int]
lazyPrimes prevs =
    let
        isDivisibleBy a b = mod a b == 0
        isDivisibleByAny a bs = any (\b -> isDivisibleBy a b) bs
        prev = head prevs
        next = head (filter (\n -> not (isDivisibleByAny n prevs)) [(prev+1) ..])
    in
        next:(lazyPrimes (next:prevs))

primes = 2:(lazyPrimes [2])

-- TODO: word boundaries problems.
