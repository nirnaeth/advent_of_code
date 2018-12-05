defmodule FrequencyAnalyzer do
  def detect(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum
  end
end

# {:ok, input} = "input/frequency_analyzer_input.txt" |> File.read
#        |> Enum.map(fn line -> line end)
#        |> String.trim()
#        |> String.split("\t")
#        |> Enum.map(fn elem -> String.to_integer(elem) end)
#      end)
