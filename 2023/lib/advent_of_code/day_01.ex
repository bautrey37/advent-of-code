defmodule AdventOfCode.Day01 do
  def part1(args) do
    args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn s ->
      case Regex.scan(~r/([[:digit:]]).*([[:digit:]])/, s) do
        [[_, first, last]] ->
          String.to_integer(first <> last)

        [] ->
          case Regex.scan(~r/([[:digit:]])/, s) do
            [[_, middle]] -> String.to_integer(middle <> middle)
          end
      end

      # String.to_charlist(s)
      # |> loop(0)
    end)
    |> Enum.sum()
  end

  def part2(args) do
    args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn s ->
      case Regex.scan(
             ~r/([[:digit:]]|one|two|three|four|five|six|seven|eight|nine).*([[:digit:]]|one|two|three|four|five|six|seven|eight|nine)/,
             s
           ) do
        [[_, first, last]] ->
          String.to_integer(string_to_int(first) <> string_to_int(last))

        [] ->
          case Regex.scan(~r/([[:digit:]]|one|two|three|four|five|six|seven|eight|nine)/, s) do
            [[_, middle]] -> String.to_integer(string_to_int(middle) <> string_to_int(middle))
          end
      end
    end)
    |> Enum.sum()
  end

  defp string_to_int(string) do
    case string do
      "one" -> "1"
      "two" -> "2"
      "three" -> "3"
      "four" -> "4"
      "five" -> "5"
      "six" -> "6"
      "seven" -> "7"
      "eight" -> "8"
      "nine" -> "9"
      string -> string
    end
  end

  # defp loop(list, acc) do
  #   case length(list) do
  #     0 ->
  #       acc

  #     _ ->
  #       num = concat_numbers(list, acc)
  #       if num == 0 do
  #         loop(new_list, new_acc)
  #       end
  #       loop(new_list, new_acc)
  #   end
  # end

  # defp concat_numbers(list, acc) when length(list) == 1 do
  #   char = List.first(list)

  #   new_acc =
  #     case is_int(char) do
  #       true -> acc + String.to_integer(<<char::utf8>> <> <<char::utf8>>)
  #       false -> acc
  #     end

  #   {[], new_acc}
  # end

  # defp concat_numbers(list, acc) do
  #   {first, tail} = List.pop_at(list, 0)
  #   {last, new_list} = List.pop_at(tail, -1)

  #   new_acc =
  #     case is_int(first) && is_int(last) do
  #       true -> acc + String.to_integer(<<first::utf8>> <> <<last::utf8>>)
  #       false -> acc
  #     end

  #   {new_list, new_acc}
  # end

  # defp is_int(int) do
  #   # unicode code points for charlist
  #   int >= 48 && int <= 57
  # end
end
