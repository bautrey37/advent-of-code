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

  def part2(args) do
    args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn line ->
      [_, _game_num, game_list] = Regex.run(~r/Game ([[:digit:]]*): (.*)/, line)

      min_game = %{
         blue: 0,
         red: 0,
         green: 0
      }
      acc = game_list
      |> String.split(";")
      |> Enum.reduce(min_game, fn games, acc ->
        games
        |> String.split(",")
        |> Enum.reduce(acc, fn cubes, acc ->
          [_, num, type] = Regex.run(~r/([[:digit:]]*) (blue|red|green)/, cubes)
          num = String.to_integer(num)

          cond do
            num > acc.blue && type == "blue" -> Map.replace(acc, :blue, num)
            num > acc.red && type == "red" -> Map.replace(acc, :red, num)
            num > acc.green && type == "green" -> Map.replace(acc, :green, num)
            true -> acc
          end
        end)
      end)
      acc.blue * acc.red * acc.green
    end)
    |> Enum.sum()
  end
end
