ExUnit.start

defmodule AdventOfCodeTest do
  use ExUnit.Case

  test "passphrase with unique words are counted" do
    assert AdventOfCode.valid_passphrases("a") == 1
    assert AdventOfCode.valid_passphrases("a aa") == 1
    assert AdventOfCode.valid_passphrases("a\naa") == 2
    assert AdventOfCode.valid_passphrases("aa bb cc dd ee") == 1
    assert AdventOfCode.valid_passphrases("aa bb cc dd aaa") == 1
  end

  test "passphrase with duplicated words are not counted" do
    assert AdventOfCode.valid_passphrases("a a") == 0
    assert AdventOfCode.valid_passphrases("a\na") == 2
    assert AdventOfCode.valid_passphrases("aa bb cc dd aa") == 0
    assert AdventOfCode.valid_passphrases("aa bb bb dd ee") == 0
  end

  test "valid passphrases count only unique passphrases" do
    assert AdventOfCode.valid_passphrases(
      """
      sayndz zfxlkl attjtww cti sokkmty brx fhh suelqbp
      xmuf znkhaes pggrlp zia znkhaes znkhaes
      nti rxr bogebb zdwrin
      sryookh unrudn zrkz jxhrdo gctlyz
      """) == 3
  end
end
