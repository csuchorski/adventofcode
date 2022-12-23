defmodule Helper do
  def split_by_lines(path) do
    {:ok, binary} = File.read(path)

    String.split(binary, "\n", trim: true)
    |> Enum.reduce([], fn line, acc ->
      [String.trim(line) | acc]
    end)
  end

  def split_to_tuples(lines) do
    Enum.reduce(lines, [], fn line, acc ->
      [
        String.split(line, " ", trim: true)
        |> List.delete_at(0)
        |> List.delete_at(1)
        |> List.delete_at(2)
        |> Enum.map(&String.to_integer/1)
        |> List.to_tuple()
        | acc
      ]
    end)
  end
end

stacks = %{
  1 => ["Q", "H", "C", "T", "N", "S", "V", "B"],
  2 => ["G", "B", "D", "W"],
  3 => ["B", "Q", "S", "T", "R", "W", "F"],
  4 => ["N", "D", "J", "Z", "S", "W", "G", "L"],
  5 => ["F", "V", "D", "P", "M"],
  6 => ["J", "W", "F"],
  7 => ["V", "J", "B", "Q", "N", "L"],
  8 => ["N", "S", "Q", "J", "C", "R", "T", "G"],
  9 => ["M", "D", "W", "C", "Q", "S", "J"]
}

IO.inspect(
  Helper.split_by_lines("input.txt")
  |> Helper.split_to_tuples()
)
