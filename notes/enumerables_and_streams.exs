# Elixir provides a module called Enum to work with enumerables
# see the docs: https://hexdocs.pm/elixir/Enum.html

# Elixir also provides ranges
Enum.sum(1..10)


# The pipe operator |>
# it takes the output from the expression on the left and passes it
# as the first argument to the function call on its right side
1..100 |> Enum.sum()


# As an alternative to Enum, Elixir provides the Stream module which supports lazy operations
# see the docs: https://hexdocs.pm/elixir/Stream.html
