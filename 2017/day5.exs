defmodule AdventOfCode do
  def steps([]), do: 0
  def steps(instructions) do
    consume(instructions, %{from: 0, jumps: hd(instructions)}, 0)
  end

  defp consume([], _, acc), do: acc
  defp consume(instructions, %{from: index, jumps: 0}, acc) do
    instructions
    |> List.replace_at(index, Enum.at(instructions, index) + 1)
    |> consume(%{from: index, jumps: 1}, acc + 1)
  end
  defp consume(instructions, step, acc) do
    case step[:from] + step[:jumps] + 1 > Enum.count(instructions) do
      true -> acc + 1
      false -> _consume(instructions, step, acc)
    end
  end

  defp _consume(instructions, step, acc) do
    current_position = step[:from] + step[:jumps]
    move = instructions |> Enum.at(current_position)


    instructions
    |> List.replace_at(current_position, Enum.at(instructions, current_position) + 1)
    |> consume(%{from: current_position, jumps: move}, acc + 1)
  end
end
