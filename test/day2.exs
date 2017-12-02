ExUnit.start

defmodule AdventOfCodeTest do
  use ExUnit.Case

  test "checksum is the sum of differences of min and max of all lines"do
    input =
"""
5 1 9 5
7 5 3
2 4 6 8
"""
    assert AdventOfCode.checksum(input) == 18
  end

  test "checksum of single line is the difference of min and max of the line" do
    assert AdventOfCode.checksum("5 1 9 5") == 8
  end
end
