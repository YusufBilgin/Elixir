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


# module annotations as constants
defmodule MyServer do
  @initial_state %{host: "127.0.0.1", port: 3456}
  IO.inspect @initial_state
end


def some_function, do: do_something_with(@example)

def some_function, do: do_something_with(example())
defp example, do: @example



# as temporary storage
defmodule MyTest do
  use ExUnit.Case, async: true

  @tag :external
  @tag os: :unix
  test "contacts external service" do
    # ...
  end
end
