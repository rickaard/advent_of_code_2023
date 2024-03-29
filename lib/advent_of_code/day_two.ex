defmodule AdventOfCode.DayTwo do
  @cube_amounts %{red: 12, green: 13, blue: 14}

  @spec part_one(binary()) :: integer()
  def part_one(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.filter(&valid_game?/1)
    |> Enum.map(&extract_game_id/1)
    |> Enum.sum()
  end

  @spec part_two(binary()) :: integer()
  def part_two(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&least_possible_amount_of_cubes_for_game/1)
    |> Enum.map(&calculate_power_for_game/1)
    |> Enum.sum()
  end

  defp least_possible_amount_of_cubes_for_game(game) do
    game
    |> extract_sets()
    |> Enum.flat_map(&String.split(&1, ", ", trim: true))
    |> Enum.map(&move_amount_to_end_of_string_for_cube/1)
    |> Enum.reduce(%{red: [], green: [], blue: []}, fn cube_color, cube_collection ->
      case cube_color do
        "red " <> amount -> %{cube_collection | red: cube_collection.red ++ [String.to_integer(amount)]}
        "green " <> amount -> %{cube_collection | green: cube_collection.green ++ [String.to_integer(amount)]}
        "blue " <> amount -> %{cube_collection | blue: cube_collection.blue ++ [String.to_integer(amount)]}
      end
    end)
    |> then(&%{red: Enum.max(&1.red), green: Enum.max(&1.green), blue: Enum.max(&1.blue)})
  end

  defp calculate_power_for_game(%{red: red, green: green, blue: blue}), do: red * green * blue

  defp valid_game?(game) do
    game
    |> extract_sets()
    |> Enum.all?(&valid_set?/1)
  end

  defp extract_sets(game) do
    game
    |> String.split([": ", "; "], trim: true)
    |> Kernel.tl()
  end

  defp valid_set?(set) do
    set
    |> String.split(", ", trim: true)
    |> Enum.map(&move_amount_to_end_of_string_for_cube/1)
    |> Enum.all?(&valid_cube_amount?/1)
  end

  defp move_amount_to_end_of_string_for_cube(set) do
    String.split(set, " ", trim: true)
    |> Enum.reverse()
    |> Enum.join(" ")
  end

  defp valid_cube_amount?("red " <> amount), do: String.to_integer(amount) <= @cube_amounts.red
  defp valid_cube_amount?("blue " <> amount), do: String.to_integer(amount) <= @cube_amounts.blue
  defp valid_cube_amount?("green " <> amount), do: String.to_integer(amount) <= @cube_amounts.green

  defp extract_game_id(game) do
    ["Game " <> game_id | _] = String.split(game, ":", trim: true)

    String.to_integer(game_id)
  end
end

"lib/inputs/day_two.txt"
|> File.read!()
|> AdventOfCode.DayTwo.part_one()
|> IO.inspect(label: "Sum of all valid game ID's - Part 1")

"lib/inputs/day_two.txt"
|> File.read!()
|> AdventOfCode.DayTwo.part_two()
|> IO.inspect(label: "Sum of all powers in sets - Part 2")
