# Loops in Elixir are written differently from imperative languages
# Functional languages rely on recursion. Below is an example usage of recursion
defmodule Recursion do
  def print_multiple_times(msg, n) when n > 0 do
    IO.puts(msg)
    print_multiple_times(msg, n - 1)
  end

  def print_multiple_times(_msg, 0) do
    :ok
  end
end
