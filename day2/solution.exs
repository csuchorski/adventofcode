defmodule Helper do
  def calculate([], acc), do: acc

  def calculate([a, b], acc) do
  end

  def calculate([head | tail], acc) do
  end

  def calculate(enum, acc) do
  end

  def check_result(a, b) when a == b, do: :draw
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
