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


# you cant declare named functions outside a module
# If you try it you will probably get a error message like this:
# (ArgumentError) cannot invoke def/2 outside module


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


# assign functions to variables using capture operator (&)
Math.zero?(0)
fun = &Math.zero?/1
fun.(0)


# Local or imported functions can be captured without the module
(&is_function/1).(fun)  # returns true if fun is a function


# we can also capture operators
add = &+/2
add.(1, 2)


# The capture syntax can be used as a shortcut for creating functions
fun = &(&1 + 1) # is exactly the same as this:
fn x -> x + 1 end
# &1 represents the first argument passed into the function


# Named functions in Elixir also support default arguments
defmodule Concat do
  def join(a, b, sep \\ " ") do
    a <> sep <> b
  end
end


# If a function with default values has multiple clauses, it is required to
# create a function head for declaring defaults
defmodule Concat do
  # A function head declaring defaults
  def join(a, b \\ nil, sep \\ " ")

  def join(a, b, _sep) when is_nil(b) do
    a
  end

  def join(a, b, sep) do
    a <> sep <> b
  end
end
# The underscore in _sep means that it will be ignored in this functions
