defmodule Helper do
  def split_to_letters(binary) do
    String.split(binary, "", trim: true)
  end

  def check_letter_uniq([a, b, c, d | tail], count) do
    if Enum.count(Enum.uniq([a, b, c, d])) != 4 do
      check_letter_uniq([b, c, d] ++ tail, count + 1)
    else
      count
    end
  end
end

path = "input.txt"
{:ok, binary} = File.read(path)

test_binary = "nppdvjthqldpwncqszvftbrmjlhg"

IO.inspect(
  Helper.split_to_letters(binary)
  |> Helper.check_letter_uniq(4)
)
