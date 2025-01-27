allEvenRec :: [Integer] -> [Integer]
allEvenRec [] = []
allEvenRec (h:t) = if even h then h:allEvenRec t else allEvenRec t

allEvenFilter :: [Integer] -> [Integer]
allEvenFilter = filter even

allEvenComp :: [Integer] -> [Integer]
allEvenComp xs = [x | x <- xs, even x]

revInternal :: [a] -> [a] -> [a]
revInternal [] acc = acc
revInternal (h:t) acc = revInternal t (h:acc)

rev :: [a] -> [a]
rev xs = revInternal xs []

colorPairs =
    let cs = ["black", "white", "blue", "yellow", "red"]
    in [(c1, c2) | c1 <- cs, c2 <- cs, c1 < c2]

multiplicationTable n =
    [(a, n, a*n) | a <- [1..12]]

mapColorings =
    let cs = ["red", "green", "blue"]
    in
        [(("Tennessee", a), ("Mississippi", b), ("Alabama", c), ("Georgia", d), ("Florida", e))
        | a <- cs, b <- cs, c <- cs, d <- cs, e <- cs, a /= b, a /= c, a /= d, b /= c, c /= d, c /= e, d /= e]
