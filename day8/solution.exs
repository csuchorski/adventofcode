defmodule Helper do
  def read_file(path) do
    File.read(path)
  end

  def split_by_lines(binary) do
    String.split(binary, "\n", trim: true)
    |> Enum.reduce([], fn line, acc ->
      [String.trim(line) | acc]
    end)
  end

  def split_to_numbers(lines) do
    Enum.reduce(lines, [], fn line, acc ->
      [
        String.split(line, "", trim: true)
        |> Enum.map(&String.to_integer/1)
        | acc
      ]
    end)
    |> List.flatten()
  end

  def check_visibility_row_left(result_map, tree_map) do
    for y <- 1..10,
        x <- 1..10 do
      {x, y}
    end
  end

  def generate_tuples_list(size_x, size_y) do
    for y <- 0..(size_x - 1),
        x <- 0..(size_y - 1) do
      {x, y}
    end
  end

  # def check_visibility_row_right(result_list, tree_input) do
  #   for x <- 0..size_x,
  #       y <- 0..size_y do
  #   end
  # end

  # def check_visibility_col_top(result_list, tree_input) do
  #   for x <- 0..size_x,
  #       y <- 0..size_y do
  #   end
  # end

  # def check_visibility_col_bot(result_list, tree_input) do
  #   for x <- 0..size_x,
  #       y <- 0..size_y do
  #   end
  # end
end

test_binary = """
30373
25512
65332
33549
35390
"""

{:ok, binary} = Helper.read_file("input.txt")

numbers = Helper.split_by_lines(binary) |> Helper.split_to_numbers()
tree_map = Enum.zip(Helper.generate_tuples_list(99, 99), numbers) |> Map.new()

IO.inspect(tree_map, limit: :infinity)
