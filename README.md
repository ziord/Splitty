## Splitty

Split Strings in Haskell.

#### Example:
Splitty contains the split function which has the type:

```haskell
    split::Char->[Char]->[[Char]]
``` 
or
```haskell
    split::Char->String->[String] for readability.
``` 
```haskell

    -- simple usage 
    s::String
    s = "This,is,a,test"
    split ',' s     --  ["This","is","a","test"]

    s = "This is another test"
    split ' ' s     --  ["This","is","another","test"]
```

#### Note:
This is nothing advanced or fancy, and _may_ not be used in production code as it's entirely for learning purposes.