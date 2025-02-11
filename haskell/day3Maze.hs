-- +---+---+---+
--     |   |   |
-- +   +   +   +
-- |       |     exit
-- +   +   +   +
-- |   |       |
-- +---+---+---+

data Direction = U | D | L | R deriving (Show)
type Node = [Direction] -- Open exits
type Maze = [[Node]]

maze :: Maze
maze =
    [
        [ [ D ], [ D ], [ D ] ],
        [ [ U, D, R ], [ U, D, L ], [ U, D ] ],
        [ [ U ], [ U, R ], [ U, L ] ]
    ]

opposite :: Direction -> Direction
opposite U = D
opposite D = U
opposite L = R
opposite R = L

move :: Direction -> (Int, Int) -> (Int, Int)
move U (r, c) = (r-1, c)
move D (r, c) = (r+1, c)
move L (r, c) = (r, c-1)
move R (r, c) = (r, c+1)

tryHead xs =
    case xs of
        [] -> Nothing
        (h:t) -> Just h

solveInner :: [Direction] -> (Int, Int) -> (Int, Int) -> [Direction]
solveInner dirs currCoords entranceCoords =
    if currCoords == entranceCoords
    then Just dirs
    else
        let comeFrom = opposite $ tryHead dirs in
            do
                d <- maze !! fst currCoords !! snd currCoords
                return
                    if Just d == comeFrom
                    then Nothing
                    else
                        x <- solveInner (d:dirs) (move d currCoords) entranceCoords
                        x

solve = take 1 $ solveInner [] (1, 2) (0, 0)
