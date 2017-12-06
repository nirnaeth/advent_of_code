ExUnit.start

defmodule Day5Test do
  use ExUnit.Case

  describe "AdventOfCode.steps/1" do
    test "returns the number of steps to consume an instruction completely" do
      assert Day5.steps("") == 0
      assert Day5.steps("0") == 2
      assert Day5.steps("-1") == 1

      input =
      """
      0
      3
      0
      1
      -3
      """
      assert Day5.steps(input) == 10
    end
  end
end
