module Splitty where 
import Data.List


split::Char->[Char]->[[Char]]
split ind []     = [] 
split ind string@(x:xs)
    | ind == x  = "": splitByIndex string indices indices
    | null indices = [string] 
    | otherwise = splitByIndex string indices indices
    where   indices = elemIndices ind string
            splitByIndex::[Char]->[Int]->[Int]->[[Char]]
            splitByIndex [] _ _ = []
            splitByIndex _ [] [] = []
            splitByIndex string@(x:xs) (c1:cxs) (c11:cxs11) = if t /= "" then trest else rest          
                where   f indexList = if not (null indexList) then head indexList else length string
                        firstElemInd =  head indices
                        t = if c1 == firstElemInd then take firstElemInd string else ""
                        trest = t : drop (c1 +1) (take (f cxs11) string) : splitByIndex string cxs cxs11  
                        rest = drop (c1 +1) (take (f cxs11) string) : splitByIndex string cxs cxs11

