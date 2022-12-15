defmodule Helper do
  @rock_map %{
    win: "Y",
    draw: "X",
    lose: "Z"
  }
  @paper_map %{
    win: "Z",
    draw: "Y",
    lose: "X"
  }
  @scissors_map %{
    win: "X",
    draw: "Z",
    lose: "Y"
  }

  def calculate([], acc), do: acc

  def calculate(a, b, acc) do
    calculate([], acc + calc_result(a, b))
  end

  def calculate([[a, b] | tail], acc) do
    calculate(tail, acc + calc_result(a, choose_move(a, b)))
  end

  def calc_result("A", "X"), do: 4
  def calc_result("B", "Y"), do: 5
  def calc_result("C", "Z"), do: 6

  def calc_result("C", "X"), do: 7
  def calc_result("A", "Y"), do: 8
  def calc_result("B", "Z"), do: 9

  def calc_result(_, "X"), do: 1
  def calc_result(_, "Y"), do: 2
  def calc_result(_, "Z"), do: 3

  def choose_move("A", "X"), do: @rock_map.lose
  def choose_move("B", "X"), do: @paper_map.lose
  def choose_move("C", "X"), do: @scissors_map.lose

  def choose_move("A", "Y"), do: @rock_map.draw
  def choose_move("B", "Y"), do: @paper_map.draw
  def choose_move("C", "Y"), do: @scissors_map.draw

  def choose_move("A", "Z"), do: @rock_map.win
  def choose_move("B", "Z"), do: @paper_map.win
  def choose_move("C", "Z"), do: @scissors_map.win
end

{:ok, binary} = File.read("./input.txt")

lines =
  String.split(binary, "\n")
  |> Enum.reduce([], fn line, acc ->
    [String.trim(line) | acc]
  end)

abc =
  Enum.reduce(lines, [], fn line, acc ->
    small_list = String.split(line)

    [small_list | acc]
  end)

test = [
  ["A", "Y"],
  ["B", "X"],
  ["C", "Z"]
]

IO.inspect(Helper.calculate(abc, 0))
