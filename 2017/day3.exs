defmodule AdventOfCode do
  require Integer
  [
[1],
[2, 3, 4, 5, 6, 7, 8, 9],
[0, 1, 0, 1, 0, 1, 0, 1] # s |> Enum.map(fn(x) -> rem(x, round(Enum.count(s) / 4)) end)
[10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
[-1, 0, 1, 2, -1, 0, 1, 2, -1, 0, 1, 2]
[26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44,
  45, 46, 47, 48, 49]
]
  # def coordinates(1), do: {0, 0}

  # def coordinates(2), do: {1, 0}
  # def coordinates(3), do: {1, 1}
  # def coordinates(4), do: {0, 1}
  # def coordinates(5), do: {-1, 1}
  # def coordinates(6), do: {-1, 0}
  # def coordinates(7), do: {-1, -1}
  # def coordinates(8), do: {0, -1}
  # def coordinates(9), do: {1, -1}

  # def coordinates(10), do: {2, -1}
  # def coordinates(11), do: {2, 0}
  # def coordinates(12), do: {2, 1}
  # def coordinates(13), do: {2, 2}
  # def coordinates(14), do: {1, 2}
  # def coordinates(15), do: {0, 2}
  # def coordinates(16), do: {-1, 2}
  # def coordinates(17), do: {-2, 2}
  # def coordinates(18), do: {-2, 1}
  # def coordinates(19), do: {-2, 0}
  # def coordinates(20), do: {-2, -1}
  # def coordinates(21), do: {-2, -2}
  # def coordinates(22), do: {-1, -2}
  # def coordinates(23), do: {0, -2}
  # def coordinates(24), do: {1, -2}
  # def coordinates(25), do: {2, -2}

  # def coordinates(26), do: {3, -2}

  # [[1], [2, 3, 4, 5, 6, 7, 8, 9], [10]]
    # """
# 37 36 35 34 33 32 31
# 38 17 16 15 14 13 30
# 39 18  5  4  3 12 29
# 40 19  6  1  2 11 28
# 41 20  7  8  9 10 27
# 42 21 22 23 24 25 26
# 43 44 45 46 47 48 49 50
# """

  # root = round(Float.ceil(:math.sqrt(277678)))
  # cur_r =
  # case rem(root, 2) != 0 do
  #   true -> root
  #   false -> root + 1
  # end

  # num_r = round((cur_r - 1) / 2)

  # cycle = n - ((cur_r - 2) * (cur_r - 2))
  # inner = rem(cycle, (cur_r - 1))

  # sol = num_r + Kernel.abs(inner - num_r)

  def steps(1), do: 0
  def steps(n) do
    generated_spiral = spiral(n)
    row = List.last(generated_spiral)
    ring = Enum.find_index(generated_spiral, fn(x) -> x == row end)
    side_length = round(Enum.count(List.last(generated_spiral)) / 4)

    distance_from_center(n, ring, side_length)
    # ring = Enum.count(generated_spiral)
    # list = List.last(generated_spiral)

    # side_length = round(Enum.count(List.last(generated_spiral)) / 4)
    # position_in_side = rem(Enum.find_index(list, fn(x) -> x == n end) + 1, side_length)
    # distance_from_axis = position_in_side - 2

    # # shift = rem(Enum.find_index(list, fn(x) -> x == n end), arm_length) + 2

    # # IO.puts arm_length

    # IO.puts Kernel.abs(distance_from_axis)
    # IO.puts side_length
    # Kernel.abs(distance_from_axis) - round(side_length / 2)
  end

  defp distance_from_center(n, ring, side_length) do
    case upper_odd_root?(n, :math.sqrt(n)) do
      true -> ring * 2
      false ->
        n
        |> odd_root_distance(side_length)
      end
  end
  # defp distance_from_center(n, l, ring) do
  #   arm_length = round(Enum.count(List.last(generated_spiral)) / 4)
  #   shift = rem(Enum.find_index(small, fn(x) -> x == 25 end) + 1, arm_length) - 2
  #   abs(shift)

  #   rem(Enum.find_index(l, fn(x) -> x == n end) + 1, round(8 / (ring - 1)))
  # end

  defp odd_root_distance(n, side_length) do
    IO.puts side
    x = (n - 1) / side_length
    y = -x

    round(Kernel.abs(x - 0) + Kernel.abs(y - 0))
  end

  defp spiral(n) do
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
    if upper_odd_root?(n, square_root) do
      previous_squarable_odd(round(square_root))..n |> Enum.to_list
    end
  end

  defp upper_odd_root?(n, root) do
    Integer.is_odd(n) && root == Float.floor(root)
  end

  defp previous_squarable_odd(n) do
    case Integer.is_odd(n - 1) do
      true -> round(:math.pow(n - 1, 2)) + 1
      false -> previous_squarable_odd(n - 1)
    end
  end

  defp next_squarable_odd(n) do
    case upper_odd_root?(n + 1, :math.sqrt(n + 1)) do
      true -> n + 1
      false -> next_squarable_odd(n + 1)
    end
  end

  defp last_line(n) do
    square_root = :math.sqrt(n)
    previous_squarable_odd(round(square_root))..n |> Enum.to_list
  end
end
