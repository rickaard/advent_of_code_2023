defmodule AdventOfCode.DayOne do
  @integer_word_to_string_integer %{
    "one" => "o1e",
    "two" => "t2o",
    "three" => "th3ee",
    "four" => "fo4r",
    "five" => "fi5e",
    "six" => "s6x",
    "seven" => "se7en",
    "eight" => "ei8ht",
    "nine" => "ni9e"
  }

  @spec part_one(binary()) :: integer()
  def part_one(input) when is_binary(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&calibration_value_for_line(&1, part: :one))
    |> Enum.sum()
  end

  @spec part_two(binary()) :: integer()
  def part_two(input) when is_binary(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&calibration_value_for_line(&1, part: :two))
    |> Enum.sum()
  end

  defp calibration_value_for_line(line, part) do
    line
    |> extract_string_integers(part)
    |> then(&(List.first(&1) <> List.last(&1)))
    |> String.to_integer()
  end

  defp extract_string_integers(string, part: :one) do
    string
    |> String.split("", trim: true)
    |> Enum.reject(&(Integer.parse(&1) == :error))
  end

  defp extract_string_integers(string, part: :two) do
    @integer_word_to_string_integer
    |> Map.keys()
    |> Enum.reduce(string, fn word, transformed_string ->
      String.replace(transformed_string, word, @integer_word_to_string_integer[word])
    end)
    |> String.split("", trim: true)
    |> Enum.reject(&(Integer.parse(&1) == :error))
  end
end

"lib/inputs/day_one.text"
|> File.read!()
|> AdventOfCode.DayOne.part_one()
|> IO.inspect(label: "Sum of all calibration values - Part 1")

"lib/inputs/day_one.text"
|> File.read!()
|> AdventOfCode.DayOne.part_two()
|> IO.inspect(label: "Sum of all calibration values - Part 2")
