defmodule FrequencyAnalyzer do
  def detect(input) do
    input
    |> to_integers
    |> Enum.sum
  end

  def calibration_frequency(input) do
    input
    |> to_integers
    |> Enum.map_reduce(0, fn x, acc -> {acc, x + acc} end)
    |> calibrate(input |> to_integers)
  end

  defp to_integers(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def calibrate({frequencies, frequency}, input) do
    case calibrated?([frequency | frequencies]) do
      true -> frequency
      false -> input
               |> Enum.map_reduce(frequency, fn x, acc -> {acc, x + acc} end)
               |> calibrate(input)
    end
  end

  defp calibrated?([]), do: false
  defp calibrated?([head | tail]) do
    case Enum.any?(tail, fn(x) -> x == head end) do
      true -> true
      false -> calibrated?(tail)
    end
  end
end

# {:ok, input} = "input/frequency_analyzer_input.txt" |> File.read
#        |> Enum.map(fn line -> line end)
#        |> String.trim()
#        |> String.split("\t")
#        |> Enum.map(fn elem -> String.to_integer(elem) end)
#      end)
