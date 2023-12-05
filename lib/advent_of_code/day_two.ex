defmodule AdventOfCode.DayTwo do
  @cube_amounts %{red: 12, green: 13, blue: 14}

  def part_one(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.filter(&valid_game?/1)
    |> Enum.map(&extract_game_id/1)
    |> Enum.sum()
  end

  defp valid_game?(game) do
    game
    |> String.split([": ", "; "], trim: true)
    |> Kernel.tl()
    |> Enum.all?(&valid_set?/1)
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
