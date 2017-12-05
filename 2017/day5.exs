defmodule AdventOfCode do
  def steps([]), do: 0
  def steps(instructions) do
    [1, 1, 1]
    # acc + 1
    # head + 1

    #consume(instructions)
    _consume(instructions, )

  end

  defp _consume([], _, acc), do: acc
  defp _consume([head | tail], 0, acc) do
    _consume([head + 1 | tail], head, acc + 1)
  end

end
