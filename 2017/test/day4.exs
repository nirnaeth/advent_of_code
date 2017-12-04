ExUnit.start

defmodule AdventOfCodeTest do
  use ExUnit.Case

  test "passphrase with unique words are valid" do
    assert AdventOfCode.valid?("a") == true
    assert AdventOfCode.valid?("a aa") == true
    assert AdventOfCode.valid?("a\naa") == true
    assert AdventOfCode.valid?("aa bb cc dd ee") == true
    assert AdventOfCode.valid?("aa bb cc dd aaa") == true
  end

  test "passphrase with duplicated words are not valid" do
    assert AdventOfCode.valid?("a a") == false
    assert AdventOfCode.valid?("a\na") == false
    assert AdventOfCode.valid?("aa bb cc dd aa") == false
    assert AdventOfCode.valid?("aa bb bb dd ee") == false
    assert AdventOfCode.valid?("""
      aa bb cc
      dd aa
    """) == false
  end
end
