# module annotations syntax
defmodule Math do
  @moduledoc """
  Provides math-related functions.

  ## Examples

    iex> Math.sum(1, 2)
    3

  """

  @doc """
  Calculate the sum of two numbers.
  """
  def sum(a, b), do: a + b
end

# @moduledoc - provides a documentation for the module
# @doc - provides a documentation for the function or macro
# @spec - provides a typespec for the function that follows the attribute
