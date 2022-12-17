defmodule Helper do
  @alphabet String.split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", "")

  def build_id_list(lines) do
    Enum.reduce(lines, [], fn pack, acc ->
      find_duplicate(pack) ++ acc
    end)
  end

  def find_duplicate(input) do
    input = String.split(input, "", trim: true)

    map_set1 =
      Enum.slice(input, 0, div(length(input), 2))
      |> MapSet.new()

    map_set2 =
      Enum.slice(input, div(length(input), 2), div(length(input), 2) + 1)
      |> MapSet.new()

    MapSet.intersection(map_set1, map_set2) |> MapSet.to_list()
  end

  def map_id_to_number(id_list) do
    Enum.map(id_list, fn id_letter ->
      Enum.find_index(@alphabet, fn alpha_letter -> alpha_letter == id_letter end)
    end)
  end
end

{:ok, binary} = File.read("./input.txt")

test = """
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"""

a = "vJrwpWtwJgWrhcsFMMfFFhFp"

lines =
  String.split(binary, "\n", trim: true)
  |> Enum.reduce([], fn line, acc ->
    [String.trim(line) | acc]
  end)

IO.inspect(
  Helper.build_id_list(lines)
  |> Helper.map_id_to_number()
  |> Enum.sum()
)
