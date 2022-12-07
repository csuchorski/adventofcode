defmodule Helper do
  def group_sums([], _sum, acc), do: acc

  def group_sums(["" | tail], temp_sum, acc) do
    group_sums(tail, 0, [temp_sum | acc])
  end

  def group_sums([num | tail], temp_sum, acc) do
    group_sums(tail, temp_sum + String.to_integer(num), acc)
  end

  def group_sums(num, temp_sum, acc) do
    [temp_sum + String.to_integer(num) | acc]
  end
end

{:ok, binary} = File.read("./input.txt")

lines =
  String.split(binary, "\n")
  |> Enum.reduce([], fn line, acc ->
    [String.trim(line) | acc]
  end)

sums =
  Helper.group_sums(lines, 0, [])
  |> Enum.sort(&(&1 >= &2))

IO.inspect(Enum.at(sums, 0) + Enum.at(sums, 1) + Enum.at(sums, 2))
