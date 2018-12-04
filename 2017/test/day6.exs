ExUnit.start

defmodule Day6Test do
  use ExUnit.Case

  test "returns the number of cycle before next repetition" do
    assert Day6.cycles("0 2 7 0") == 5
  end
end
