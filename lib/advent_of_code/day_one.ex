defmodule AdventOfCode.DayOne do
  def summed_calibration_values(input) when is_binary(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&calibration_value_for_line/1)
    |> Enum.sum()
  end

  defp calibration_value_for_line(line) do
    line
    |> extract_string_integers()
    |> then(&(List.first(&1) <> List.last(&1)))
    |> String.to_integer()
  end

  defp extract_string_integers(string) do
    string
    |> String.split("", trim: true)
    |> Enum.reject(&(Integer.parse(&1) == :error))
  end
end

"lib/inputs/day_one.text"
|> File.read!()
|> AdventOfCode.DayOne.summed_calibration_values()
|> IO.inspect(label: "Sum of all calibration values")
