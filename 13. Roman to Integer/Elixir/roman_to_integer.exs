defmodule Solution do
  @dictionary %{
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }

  @spec roman_to_int(s :: String.t) :: integer
  def roman_to_int(s) do
    String.graphemes(s)
    |> convert([])
    |> Enum.sum
  end

  def convert(["I" | ["V" | tail]], acc) do convert(tail, [4 | acc]) end
  def convert(["I" | ["X" | tail]], acc) do convert(tail, [9 | acc]) end
  def convert(["X" | ["L" | tail]], acc) do convert(tail, [40 | acc]) end
  def convert(["X" | ["C" | tail]], acc) do convert(tail, [90 | acc]) end
  def convert(["C" | ["D" | tail]], acc) do convert(tail, [400 | acc]) end
  def convert(["C" | ["M" | tail]], acc) do convert(tail, [900 | acc]) end
  def convert([term | tail], acc) do convert(tail, [@dictionary[term] | acc]) end
  def convert([], acc) do acc end
end
