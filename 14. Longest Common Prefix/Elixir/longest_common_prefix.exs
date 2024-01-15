defmodule Solution do
  @spec longest_common_prefix(strs :: [String.t]) :: String.t
  def longest_common_prefix(strs) do
    Enum.reduce(strs, &prefix_builder/2)
  end

  def prefix_builder([]), do: ""
  def prefix_builder(string_a, string_b) do
    prefix_builder(String.graphemes(string_a), String.graphemes(string_b), "")
  end
  def prefix_builder([matching_character | tail_string_a], [matching_character | tail_string_b], prefix) do
    prefix_builder(tail_string_a, tail_string_b, matching_character <> prefix)
  end
  def prefix_builder(_, _, prefix) do
    String.reverse(prefix)
  end
end

# start
# to find the longest common prefix, we'll evaluate each letter of each string for matches.
# In elixir, we can take the list of strings and reduce them where we'll have the first string and the
# second string and we'll check if the string's first characters match. If they do, we'll add that to a
# prefix variable. and if they don't match, we'll give back the prefix and reverse it.
# end
