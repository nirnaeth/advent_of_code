ExUnit.start

defmodule Day7Test do
  use ExUnit.Case

  describe "AdventOfCode.root/1" do
    test "returns the root program" do
      input =
"""
pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)
"""

      assert Day7.root(input) == "tknk"
    end
  end
end
