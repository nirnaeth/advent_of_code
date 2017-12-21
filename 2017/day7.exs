defmodule Day7 do
  def root(programs) do
    programs
    |> Enum.reject(fn([_, _, holding]) -> holding == [] end)
    |> Enum.find(fn(x) -> unique?(x, programs) end)
    |> List.first
  end

  defp unique?([current | _], all) do
    all
    |> Enum.map(fn([_, _, holding]) -> not(Enum.member?(holding, current)) end)
    |> Enum.reduce(fn(x, acc) -> x and acc end)
  end
end
