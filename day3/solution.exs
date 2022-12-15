defmodule Helper do
  def build_id_list(lines) do
    Enum.reduce(lines, [], fn pack, acc ->
      find_duplicate(pack) ++ acc
    end)
  end

  def find_duplicate(input) do
    tab = String.split(input, "", trim: true)
    duplicate = tab -- Enum.uniq(tab)
  end
end

{:ok, binary} = File.read("./input.txt")

lines =
  String.split(binary, "\n", trim: true)
  |> Enum.reduce([], fn line, acc ->
    [String.trim(line) | acc]
  end)

IO.inspect(Helper.build_id_list(lines))
