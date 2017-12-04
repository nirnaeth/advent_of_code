defmodule AdventOfCode do
  def valid_passphrases(input) do
    input
    |> passphrases
    |> Enum.map(fn(p) -> unique?(p) && no_permutations?(p) end)
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

  defp no_permutations?(input) do
    input
    |> words
    |> Enum.map(fn(w) -> sort(w) end)
    |> Enum.join(" ")
    |> unique?
  end

  def duplicate_word?([]), do: false
  def duplicate_word?([head | tail]) do
    case Enum.any?(tail, fn(x) -> x == head end) do
      true -> true
      false -> duplicate_word?(tail)
    end
  end

  defp sort(input) do
    input
    |> String.to_charlist
    |> Enum.sort
    |> to_string
  end
end

# p |> String.split |> Enum.map(fn(w) -> w |> String.to_charlist |> Enum.sort |> to_string end) |> Enum.map(fn(p) -> AdventOfCode.unique?(p) end)
