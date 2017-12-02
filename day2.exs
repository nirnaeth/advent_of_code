defmodule AdventOfCode do
  def checksum(input) do
    input
    |> String.split(["\n"], trim: true)
    |> to_list_of_lists
    |> Enum.map(fn(x) -> min_max_difference x end)
    |> Enum.sum
  end

  defp to_list_of_lists(input) do
    input
    |> Enum.map(fn(x) -> to_list_of_integers x end)
  end

  defp to_list_of_integers(input) do
    input
    |> String.split
    |> Enum.map(&String.to_integer/1)
  end

  defp min_max_difference(input) do
    x =
    input
    |> Enum.min_max

    elem(x, 1) - elem(x, 0)
  end
end
