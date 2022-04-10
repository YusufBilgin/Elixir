# case syntax
x = 1
case x do
    1 -> 
        "x is equal to 1"
    2 ->
        "x is equal to 2"
    _ ->
        "x is neither 1 or 2"
end


# If you want to pattern match against an existing variable, you need to use the ^ operator
x = 1
case 10 do
    ^x -> "Won't match"
    _ -> "Will match"
end


# We can give extra conditions via guards
case {1, 2, 3} do
    {1, x, 3} when x > 0 -> "Will match"  # will only match when x is positive
    _ -> "Would match, if guard condition were not satisfied"
end


# anonymous functions can also have clauses and guards
# note that the arguments in each anonymous function clause needs to be the same
f = fn 
    x, y when x > 0 -> x + y
    x, y -> x * y
end


# cond syntax 

cond do
    2 + 2 == 5 ->
        "This will not be True"
    2 * 2 == 3 ->
        "Nor this"
    1 + 1 == 2 ->
        "But this will"
end    

 