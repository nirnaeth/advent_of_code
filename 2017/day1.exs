defmodule AdventOfCode do
  def inverse_captcha(input) do
    inputs_list = to_lists(input)

    inputs_list
    |> List.first
    |> _inverse_captcha(List.last(inputs_list))
  end

  defp to_lists(input) do
    input
    |> String.graphemes
    |> Enum.map(&String.to_integer/1)
    |> Enum.split(captcha_length(input))
    |> Tuple.to_list
  end

  defp captcha_length(input) do
    round(String.length(input) / 2)
  end

  defp _inverse_captcha([], []), do: 0
  defp _inverse_captcha([first_head | first_tail], [second_head | second_tail]) when first_head == second_head do
    first_head + second_head + _inverse_captcha(first_tail, second_tail)
  end
  defp _inverse_captcha([ _ | first_tail], [ _ | second_tail]) do
    _inverse_captcha(first_tail, second_tail)
  end
end
