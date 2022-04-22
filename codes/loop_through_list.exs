defmodule Recursion do
  def loop_through_list([head | tail], kw) do
    String.contains?(head, kw) |> IO.puts()
    loop_through_list(tail, kw)
  end

  def loop_through_list([], _kw) do
    IO.puts("end of list")
  end
end
