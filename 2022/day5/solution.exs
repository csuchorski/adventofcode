defmodule Helper do
  def split_by_lines(binary) do
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

  def move_elem([], stacks), do: stacks

  def move_elem([{count, from, to} | tail], stacks) do
    changed_stacks =
      for n <- 1..count, reduce: stacks do
        stacks ->
          {val, stack_from} = List.pop_at(Enum.at(stacks, from - 1), 0)
          stack_to = List.insert_at(Enum.at(stacks, to - 1), 0, val)

          List.replace_at(stacks, from - 1, stack_from)
          |> List.replace_at(to - 1, stack_to)
      end

    move_elem(tail, changed_stacks)
  end

  def move_elem_pt2([], stacks), do: stacks

  def move_elem_pt2([{count, from, to} | tail], stacks) do
    {moved_boxes, stack_from} = Enum.split(Enum.at(stacks, from - 1), count)
    stack_to = moved_boxes ++ Enum.at(stacks, to - 1)

    changed_stacks =
      List.replace_at(stacks, from - 1, stack_from)
      |> List.replace_at(to - 1, stack_to)

    move_elem_pt2(tail, changed_stacks)
  end

  def read_top_box(stacks) do
    Enum.each(stacks, fn stack ->
      IO.write(Enum.at(stack, 0))
    end)
  end
end

stacks = [
  ["Q", "H", "C", "T", "N", "S", "V", "B"],
  ["G", "B", "D", "W"],
  ["B", "Q", "S", "T", "R", "W", "F"],
  ["N", "D", "J", "Z", "S", "W", "G", "L"],
  ["F", "V", "D", "P", "M"],
  ["J", "W", "F"],
  ["V", "J", "B", "Q", "N", "L"],
  ["N", "S", "Q", "J", "C", "R", "T", "G"],
  ["M", "D", "W", "C", "Q", "S", "J"]
]

test_stacks = [
  ["N", "Z"],
  ["D", "C", "M"],
  ["P"]
]

test_binary = """
move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
"""

path = "input.txt"
{:ok, binary} = File.read(path)

IO.inspect(
  Helper.split_by_lines(binary)
  |> Helper.split_to_tuples()
  |> Helper.move_elem_pt2(stacks)
  |> Helper.read_top_box()
)
