defmodule Day3 do
  require Integer
  # [[1], [2, 3, 4, 5, 6, 7, 8, 9], [10]]

  def spiral(n) do
    all_but_last(n) ++ [last_line(n)]
  end

  defp all_but_last(n) do
    1..n - 1
    |> Enum.map(fn(x) -> line_for(x) end)
    |> Enum.reject(fn(x) -> x == nil end)
  end

  defp line_for(1), do: [1]
  defp line_for(n) do
    square_root = :math.sqrt(n)
    if Integer.is_odd(n) && square_root == Float.floor(square_root) do
      previous_squarable_odd(round(square_root))..n |> Enum.to_list
    end
  end

  defp last_line(n) do
    square_root = :math.sqrt(n)
    previous_squarable_odd(round(square_root))..n |> Enum.to_list
  end

  defp previous_squarable_odd(n) do
    case Integer.is_odd(n - 1) do
      true -> round(:math.pow(n - 1, 2)) + 1
      false -> previous_squarable_odd(n - 1)
    end
  end
end
