ExUnit.start

defmodule Day2Test do
  use ExUnit.Case

  test "checksum is the sum of the division of the two evenly divisible numbers on all lines"do
    input =
"""
5 9 2 8
9 4 7 3
3 8 6 5
"""
    assert Day2.checksum(input) == 9
  end

  test "checksum of single line is the division of the two evenly divisible numbers of the line" do
    assert Day2.checksum("5 9 2 8") == 4
  end
end
