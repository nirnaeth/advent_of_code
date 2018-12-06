defmodule FrequencyAnalyzer do
  def detect(input) do
    input
    |> to_integers
    |> Enum.sum
  end

  defp to_integers(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

#  recursive function?
  def calibration_frequency(input) do
    input
    |> to_integers
    |> Enum.map_reduce(0, fn x, acc -> {acc, x + acc} end)
  end
end

# {:ok, input} = "input/frequency_analyzer_input.txt" |> File.read
#        |> Enum.map(fn line -> line end)
#        |> String.trim()
#        |> String.split("\t")
#        |> Enum.map(fn elem -> String.to_integer(elem) end)
#      end)
