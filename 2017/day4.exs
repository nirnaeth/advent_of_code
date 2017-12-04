defmodule AdventOfCode do
  def valid?(input) do
    input
    |> String.split
    |> duplicate_in?
    |> Kernel.not
  end

  defp duplicate_in?([]), do: false
  defp duplicate_in?([head | tail]) do
    case Enum.any?(tail, fn(x) -> x == head end) do
      true -> true
      false -> duplicate_in?(tail)
    end
  end
end

