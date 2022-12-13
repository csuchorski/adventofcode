defmodule Helper do
  @first {"A", "B", "C"}
  @second {"X", "Y", "Z"}

  def calculate([], acc), do: acc

  def calculate([a, b], acc) do
  end

  def calculate([head | tail], acc) do
  end

  #   def check_result(a, b) do
  #     case {a, b} do
  #       {?a} ->
  #         :draw

  #       {"A", "Y"} ->
  #         :loss
  #     end
  #   end
  # end

  def check_result("A", "X"), do: :draw
  def check_result("B", "Y"), do: :draw
  def check_result("C", "Z"), do: :draw

  def check_result("A", "Y"), do: :win
  def check_result("B", "Z"), do: :win
  def check_result("C", "X"), do: :win

  def check_result(_, _), do: :loss
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

IO.inspect(abc)
