# Keyword list syntax (similar to dictionaries in other languages)
keyword_list = [key: value, key2: value2] # key is an atom
keyword_list[:key] # reading the value of a keyword

# note: keyword lists are simply lists, so it will take much time
# to find a key by working with big lists. Therefore u can use map
# instead of using keyword lists.

# note2: keyword lists allow only atom as keyword


# Map syntax %{}
map = %{:a => 1, 2 => :b}

# note: maps allow any value as keyword

# note2: maps keys do not follow any ordering.


# update a key's value in maps
map = %{:a => 1, 2 => :b}
%{map | 2 => "two"}

# accessing a key's value
map.a
