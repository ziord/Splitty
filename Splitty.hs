module Splitty where 
import Data.List


clean::[String]->[String]
clean = filter (/= "")


splitByIndex::Char->String->[Int]->[Int]->[String]
splitByIndex ind [] _ _ = []
splitByIndex ind _ [] [] = []
splitByIndex ind string@(x:xs) (c1:cxs) (c11:cxs11) = if t /= "" then trest else rest          
    where   f indexList = if not $ null indexList then head indexList else length string
            indices = elemIndices ind string
            firstElemInd =  head indices
            t = if c1 == firstElemInd then take firstElemInd string else ""
            trest = t : drop (c1 +1) (take (f cxs11) string) : splitByIndex ind string cxs cxs11  
            rest = drop (c1 +1) (take (f cxs11) string) : splitByIndex ind string cxs cxs11


_split::Char->[Char]->[[Char]]
_split ind []     = [] 
_split ind string@(x:_)
    | ind == x  = "": splitByIndex ind string indices indices
    | null indices = [string] 
    | otherwise =  splitByIndex ind string indices indices
    where   indices = elemIndices ind string


split::Char->[Char]->[[Char]]
split ind str = if ind == ' ' then clean $ _split ind str else _split ind str
            

