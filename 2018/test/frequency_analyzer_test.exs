ExUnit.start

Code.require_file("../frequency_analyzer.exs", __DIR__)

defmodule FrequencyAnalyzerTest do
  use ExUnit.Case

  test "frequency goes up when input is positive" do
    input =
      """
      +1
      """
    assert FrequencyAnalyzer.detect(input) == 1
  end

  test "frequency goes down when input is positive" do
    input =
      """
      +1
      -2
      """
    assert FrequencyAnalyzer.detect(input) == -1
  end

  test "device is calibrated when it encounters the same frequency a second time" do
    input =
      """
      +2
      -1
      +1
      """

      assert FrequencyAnalyzer.calibration_frequency(input) == 2
  end
end
