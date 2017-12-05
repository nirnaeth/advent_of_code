ExUnit.start

defmodule AdventOfCodeTest do
  use ExUnit.Case

  # describe "AdventOfCode.steps/1" do
    test "returns the  number of steps to consume an instruction completely" do
      assert AdventOfCode.steps([]) == 0
      assert AdventOfCode.steps([0]) == 2
      assert AdventOfCode.steps([-1]) == 1
      assert AdventOfCode.steps([0, 3,  0,  1,  -3]) == 5
    end
  end
end
