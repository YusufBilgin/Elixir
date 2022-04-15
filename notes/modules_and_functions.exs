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
