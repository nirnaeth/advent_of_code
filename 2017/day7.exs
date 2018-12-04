defmodule Day7 do
  def root(input) do
    branches = input |> parse |> with_leaves

    branches
    # |> Enum.find(fn(x) -> unique?(branches, x) end)
    # |> List.first
  end

  def parse(input) do
    input
    |> String.split(["\n"], trim: true)
    |> Enum.map(fn(x) -> x |> String.split([" (", ") -> ", ")"], trim: true) end)
    |> Enum.map(fn(x) -> x |> pick_leaves end)
  end

  def pick_leaves([branch, weight]), do: [branch, weight, []]
  def pick_leaves([branch, weight, leaves]) do
    [branch, weight, leaves |> String.split([", "], trim: true)]
  end

  def unique?(all, [current | _]) do
    all
    |> Enum.map(fn([_, _, holding]) -> not(Enum.member?(holding, current)) end)
    |> Enum.reduce(fn(x, acc) -> x and acc end)
  end

  def leaf?([_, _, []]), do: true
  def leaf?([_, _, _]), do: false

  def with_leaves(list) do
    list
    |> Enum.filter(fn(x) -> not leaf?(x) end)
  end
end
