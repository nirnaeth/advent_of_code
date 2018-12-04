defmodule Day6 do
  def cycles(input) do
    input
    |> to_map
    |> redistribute
  end

  defp to_map(input) do
    input
    |> String.split()
    |> Enum.with_index
    |> Enum.reduce(%{}, fn(x, acc) ->
                          acc
                          |> Map.put(elem(x, 1), String.to_integer(elem(x, 0)))
                        end
                  )
  end

  defp redistribute(banks) do
    occurrences = [banks] # push
    banks_max = banks |> map_max_by_value

    # increment
    banks
    |> increment_by(banks_max)
    |> _redistribute(occurrences)
  end

  def map_max_by_value(map) do
    values_max = map |> Map.values |> Enum.max
    map |> Enum.max_by(fn(x) -> elem(x, 1) == values_max end)
  end

  defp _redistribute(banks, occurrences) do
    IO.inspect banks
    IO.inspect occurrences
    repetition = occurrences |> Enum.any?(fn(x) -> x == banks end)

    case repetition do
      true -> Enum.count(occurrences)
      false ->
        banks_max = banks |> map_max_by_value

        banks
        |> Map.replace(elem(banks_max, 0), 0) # empty maxed bank
        |> increment_by(banks_max)
        |> _redistribute([banks, occurrences])
    end
  end

  def increment_by(map, {_, 0}), do: map
  def increment_by(map, tuple) do
    new_key = map |> next_key(elem(tuple, 0))
    new_value = map[new_key] + 1
    deacc = elem(tuple, 1) - 1

    IO.inspect map
    IO.inspect tuple

    IO.inspect new_key
    IO.inspect new_value

    map
    |> Map.replace(new_key, new_value)
    |> increment_by({new_key + 1, deacc})
  end

  defp next_key(map, index) do
    case index + 1 < Enum.count(map) do
      true -> 0
      false -> index + 1
    end
  end
end
