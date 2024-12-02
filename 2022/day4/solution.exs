defmodule Helper do
  def split_by_lines(path) do
    {:ok, binary} = File.read(path)

    String.split(binary, "\n", trim: true)
    |> Enum.reduce([], fn line, acc ->
      [String.trim(line) | acc]
    end)
  end

  def split_to_number(lines) do
    Enum.reduce(lines, [], fn line, acc ->
      [String.split(line, [",", "-"], trim: true) | acc]
    end)
  end

  def check_range_overlap([], count), do: count

  def check_range_overlap([[a, b, c, d] | tail], count) do
    a = String.to_integer(a)
    b = String.to_integer(b)
    c = String.to_integer(c)
    d = String.to_integer(d)

    if (a <= c && b >= d) || (c <= a && d >= b) do
      IO.inspect({true, a, b, c, d})
      check_range_overlap(tail, count + 1)
    else
      IO.inspect({false, a, b, c, d})

      check_range_overlap(tail, count)
    end
  end

  def check_range_overlap_pt2([], count), do: count

  def check_range_overlap_pt2([[a, b, c, d] | tail], count) do
    a = String.to_integer(a)
    b = String.to_integer(b)
    c = String.to_integer(c)
    d = String.to_integer(d)

    if Range.disjoint?(a..b, c..d) do
      check_range_overlap_pt2(tail, count)
    else
      check_range_overlap_pt2(tail, count + 1)
    end
  end
end

IO.inspect(
  Helper.split_by_lines("./input.txt")
  |> Helper.split_to_number()
  |> Helper.check_range_overlap_pt2(0)
)
