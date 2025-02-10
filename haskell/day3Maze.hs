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

move :: Direction -> (Int, Int) -> (Int, Int)
move U (r, c) = (r-1, c)
move D (r, c) = (r+1, c)
move L (r, c) = (r, c-1)
move R (r, c) = (r, c+1)

solveInner :: [Direction] -> (Int, Int) -> (Int, Int) -> [Direction]
solveInner dirs currCoords entranceCoords =
    if currCoords == entranceCoords
    then Just dirs
    else
        do
            d <- maze !! fst currCoords !! snd currCoords
            -- TODO: don't recurse if direction is opposite to previous direction we've just come.
            x <- solveInner (d:dirs) (move d currCoords) entranceCoords
            return x

solve = take 1 $ solveInner [] (1, 2) (0, 0)
