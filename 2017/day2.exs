defmodule AdventOfCode do
  def checksum(input) do
    input
    |> String.split(["\n"], trim: true)
    |> to_list_of_lists
    |> Enum.map(fn(x) -> Enum.sort(x, &(&1 >= &2)) end)
    |> Enum.map(fn(x) -> _division_of_evenly x end)
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

  defp _division_of_evenly([]), do: 0
  defp _division_of_evenly([head | tail]) do
    case evenly_divisible(head, tail) do
      [] -> _division_of_evenly(tail)
      x -> round(head / hd(x))
    end
  end

  defp evenly_divisible(element, list), do: Enum.filter(list, fn(x) -> rem(element, x) == 0 end)
end
