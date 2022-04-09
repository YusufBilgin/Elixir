# Match operator '='
x = 5

# We can also match complex data types using match operator
{a, b, c} = {:hello, "world", 42}

# We can match a list with its own head and tail
[head | tail] = [1, 2, 3]
# head = 1
# tail = [2, 3]

# In some cases, we dont care about a particular value in a pattern. We can bind those values 
# to the underscore _
[head | _] = [1, 2, 3]

