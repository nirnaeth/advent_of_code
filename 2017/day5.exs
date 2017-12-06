defmodule AdventOfCode do
  def steps(""), do: 0
  def steps(input) do
    instructions = input |> to_map

    # %{0 => 0, 1 => -1}]
    consume(instructions, %{from: 0, jumps: instructions[0]}, 0)
  end

  defp to_map(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.with_index
    |> Enum.reduce(%{}, fn(x, acc) ->
                          acc
                          |> Map.put(elem(x, 1), String.to_integer(elem(x, 0)))
                        end
                  )
  end

  # defp consume(%{}, _, acc), do: acc
  defp consume(instructions, %{from: index, jumps: 0}, acc) do
    instructions # %{0 => 0, 1 => -1}
    |> Map.replace(index, instructions[index] + 1)
    |> consume(%{from: index, jumps: 1}, acc + 1)
  end
  defp consume(instructions, step, acc) do
    case out_of_bound?(instructions, step) do
      true -> acc + 1
      false -> _consume(instructions, step, acc)
    end
  end

  defp out_of_bound?(instructions, step) do
    step[:from] + step[:jumps] + 1 > Enum.count(instructions) || step[:from] + step[:jumps] - 1 < 0
  end

  defp _consume(instructions, %{from: index, jumps: jumps}, acc) when jumps >= 3 do
    next = index + jumps

    instructions
    |> Map.replace(index, instructions[index] - 1)
    |> consume(%{from: next, jumps: instructions[next]}, acc + 1)
  end
  defp _consume(instructions, step, acc) do
    next = step[:from] + step[:jumps]

    instructions
    |> Map.replace(step[:from], instructions[step[:from]] + 1)
    |> consume(%{from: next, jumps: instructions[next]}, acc + 1)
  end
end
