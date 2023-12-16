defmodule AdventOfCode.Day02 do
  def part1(args) do
    max_blue = 14
    max_red = 12
    max_green = 13

    args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn line ->
      [_, game_num, game_list] = Regex.run(~r/Game ([[:digit:]]*): (.*)/, line)

      is_game_possible =
        game_list
        |> String.split(";")
        |> Enum.map(fn games ->
          games
          |> String.split(",")
          |> Enum.map(fn cubes ->
            [_, num, type] = Regex.run(~r/([[:digit:]]*) (blue|red|green)/, cubes)

            case type do
              "blue" -> String.to_integer(num) <= max_blue
              "red" -> String.to_integer(num) <= max_red
              "green" -> String.to_integer(num) <= max_green
            end
          end)
          |> reduce_game_results
        end)
        |> reduce_game_results

      case is_game_possible do
        true -> String.to_integer(game_num)
        false -> 0
      end
    end)
    |> Enum.sum()
  end

  defp reduce_game_results(list) do
    Enum.reduce(list, true, fn bool, acc ->
      case acc do
        true -> bool
        false -> acc
      end
    end)
  end

  def part2(_args) do
  end
end
