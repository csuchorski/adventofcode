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

  def generate_tuples_map(size_x, size_y) do
    for y <- 0..(size_x - 1),
        x <- 0..(size_y - 1) do
      {x, y}
    end
  end

  def check_visibility_row_left(result_map, tree_map) do
    size = Map.values(result_map) |> Enum.count() |> :math.sqrt() |> trunc()

    {result_map, _height} =
      for y <- 0..(size - 1),
          x <- 0..(size - 1),
          reduce: {result_map, 0} do
        {result_map, max_height} ->
          height = Map.get(tree_map, {x, y})

          max_height =
            if x == 0 do
              -1
            else
              max_height
            end

          if height > max_height do
            {Map.update!(result_map, {x, y}, fn _val -> true end), height}
          else
            {result_map, max_height}
          end
      end

    result_map
  end

  def check_visibility_row_right(result_map, tree_map) do
    size = Map.values(result_map) |> Enum.count() |> :math.sqrt() |> trunc()

    {result_map, _height} =
      for y <- 0..(size - 1),
          x <- (size - 1)..0,
          reduce: {result_map, 0} do
        {result_map, max_height} ->
          height = Map.get(tree_map, {x, y})

          max_height =
            if x == size - 1 do
              -1
            else
              max_height
            end

          if height > max_height do
            {Map.update!(result_map, {x, y}, fn _val -> true end), height}
          else
            {result_map, max_height}
          end
      end

    result_map
  end

  def check_visibility_col_top(result_map, tree_map) do
    size = Map.values(result_map) |> Enum.count() |> :math.sqrt() |> trunc()

    {result_map, _height} =
      for x <- 0..(size - 1),
          y <- 0..(size - 1),
          reduce: {result_map, 0} do
        {result_map, max_height} ->
          height = Map.get(tree_map, {x, y})

          max_height =
            if y == 0 do
              -1
            else
              max_height
            end

          if height > max_height do
            {Map.update!(result_map, {x, y}, fn _val -> true end), height}
          else
            {result_map, max_height}
          end
      end

    result_map
  end

  def check_visibility_col_bot(result_map, tree_map) do
    size = Map.values(result_map) |> Enum.count() |> :math.sqrt() |> trunc()

    {result_map, _height} =
      for x <- (size - 1)..0,
          y <- (size - 1)..0,
          reduce: {result_map, 0} do
        {result_map, max_height} ->
          height = Map.get(tree_map, {x, y})

          max_height =
            if y == size - 1 do
              -1
            else
              max_height
            end

          if height > max_height do
            {Map.update!(result_map, {x, y}, fn _val -> true end), height}
          else
            {result_map, max_height}
          end
      end

    result_map
  end

  def count_true_vals(result_map) do
    Map.values(result_map)
    |> Enum.count(fn element -> element == true end)
  end

  def calculate_view_distance_left(result_map, tree_map) do
  end

  def calculate_view_distance_right(result_map, tree_map) do
  end

  def calculate_view_distance_top(result_map, tree_map) do
  end

  def calculate_view_distance_bot(result_map, tree_map) do
  end

  def calculate_scenic_score(result_map) do
  end
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
tuples = Helper.generate_tuples_map(99, 99)
tree_map = Enum.zip(tuples, numbers) |> Map.new()
result_map = Map.new(tuples, fn key -> {key, false} end)

test_numbers = Helper.split_by_lines(test_binary) |> Helper.split_to_numbers()
test_tuples = Helper.generate_tuples_map(5, 5)
test_tree_map = Enum.zip(test_tuples, test_numbers) |> Map.new()
test_result_map = Map.new(test_tuples, fn key -> {key, false} end)

# IO.inspect(result_map, limit: :infinity)
IO.inspect(
  Helper.check_visibility_row_left(result_map, tree_map)
  |> Helper.check_visibility_row_right(tree_map)
  |> Helper.check_visibility_col_top(tree_map)
  |> Helper.check_visibility_col_bot(tree_map)
  |> Helper.count_true_vals()
)
