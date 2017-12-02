defmodule AdventOfCode do
  def inverse_captcha(input) do
    input_list = to_list(input)

    input_list
    |> _inverse_captcha
    |> Kernel.+(_inverse_captcha([List.last(input_list), List.first(input_list)]))
  end

  defp to_list(input) do
    input
    |> String.graphemes
    |> Enum.map(&String.to_integer/1)
  end

  defp _inverse_captcha([]), do: 0
  defp _inverse_captcha([first, second | tail]) when first == second do
    first + _inverse_captcha([second | tail])
  end
  defp _inverse_captcha([ _ | tail]) do
    _inverse_captcha(tail)
  end
end
