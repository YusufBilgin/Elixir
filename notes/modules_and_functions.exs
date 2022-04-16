# Modules are used to group several functions

# Module syntax
defmodule Math do
  def sum(a, b) do
    a + b
  end
end


# Compailing a Elixir module
# elixirc module_file.ex
# this command will generate a .beam file which contains the bytecode for the
# defined module


# Elixir projects are usually organized into three directories:
# _build - contains compilation artifacts
# lib - contains Elixir code (usually .ex files)
# test - contains tests (usually .exs files)


# private functions (can only be invoked on local scope)
defmodule Math do
  def sum(a, b) do
    do_sum(a, b)
  end

  defp do_sum(a, b) do
    a + b
  end
end


# Function declarations also support guards and multiple clauses
defmodule Math do
  def zero?(0) do
    true
  end

  def zero?(x) when is_integer(x) do
    false
  end
end


# Named functions support also do: syntax
defmodule Math do
  def zero?(0), do: true
  def zero?(x) when is_integer(x), do: false
end


# assign functions to variables
Math.zero?(0)
fun = &Math.zero?/1
fun.(0)
