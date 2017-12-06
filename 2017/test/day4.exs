ExUnit.start

defmodule Day4Test do
  use ExUnit.Case

  test "passphrase with unique words is counted" do
    assert Day4.valid_passphrases("a") == 1
    assert Day4.valid_passphrases("a aa") == 1
    assert Day4.valid_passphrases("a\naa") == 2
    assert Day4.valid_passphrases("aa bb cc dd ee") == 1
    assert Day4.valid_passphrases("aa bb cc dd aaa") == 1
  end

  test "passphrase with duplicated words is not counted" do
    assert Day4.valid_passphrases("a a") == 0
    assert Day4.valid_passphrases("a\na") == 2
    assert Day4.valid_passphrases("aa bb cc dd aa") == 0
    assert Day4.valid_passphrases("aa bb bb dd ee") == 0
  end

  test "valid passphrases count only unique passphrases" do
    assert Day4.valid_passphrases(
      """
      sayndz zfxlkl attjtww cti sokkmty brx fhh suelqbp
      xmuf znkhaes pggrlp zia znkhaes znkhaes
      nti rxr bogebb zdwrin
      sryookh unrudn zrkz jxhrdo gctlyz
      """) == 3
  end

  test "passhprase with anagrams is not counted" do
    assert Day4.valid_passphrases("abcde xyz ecdab") == 0
    assert Day4.valid_passphrases("oiii ioii iioi iiio") == 0
  end

  test "passhprase with no anagrams is counted" do
    assert Day4.valid_passphrases("abcde fghij") == 1
    assert Day4.valid_passphrases("a ab abc abd abf abj") == 1
    assert Day4.valid_passphrases("iiii oiii ooii oooi oooo") == 1
  end

  test "valid passhprases count unique and not anagrams passhprases" do
    assert Day4.valid_passphrases(
      """
      abcde fghij
      abcde xyz ecdab
      a ab abc abd abf abj
      iiii oiii ooii oooi oooo
      oiii ioii iioi iiio
      """
    ) == 3
  end
end
