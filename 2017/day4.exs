defmodule AdventOfCode do
  def valid_passphrases(input) do
    # passphrases = passphrases(input)
    input
    |> passphrases
    |> Enum.map(fn(p) -> unique?(p) end)
    |> Enum.reject(fn(u) -> not u end)
    |> Enum.count
  end

  defp passphrases(input) do
    input
    |> String.split("\n", trim: true)
  end

  def words(input) do
    input
    |> String.split
  end

  def unique?(input) do
    input
    |> words
    |> duplicate_word?
    |> Kernel.not
  end

  def duplicate_word?([]), do: false
  def duplicate_word?([head | tail]) do
    case Enum.any?(tail, fn(x) -> x == head end) do
      true -> true
      false -> duplicate_word?(tail)
    end
  end
end

