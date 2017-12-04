ExUnit.start

defmodule AdventOfCodeTest do
  use ExUnit.Case

  # """
# 37 36 35 34 33 32 31
# 38 17 16 15 14 13 30
# 39 18  5  4  3 12 29
# 40 19  6  1  2 11 28
# 41 20  7  8  9 10 27
# 42 21 22 23 24 25 26
# 43 44 45 46 47 48 49 50
# """

  test "calculate manhattan distance of n from the center of the spiral" do
    assert AdventOfCode.steps(12) == 3
    assert AdventOfCode.steps(23) == 2
    assert AdventOfCode.steps(1024) == 31
  end

  test "calculate manhattan of odd square roots" do
    assert AdventOfCode.steps(1) == 0
    assert AdventOfCode.steps(25) == 4
    assert AdventOfCode.steps(49) == 6
  end
end
