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
end
