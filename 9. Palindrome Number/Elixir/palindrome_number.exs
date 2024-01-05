defmodule Solution do
  @spec is_palindrome(x :: integer) :: boolean
  def is_palindrome(x) do
    x = to_string(x)
    x == String.reverse(x)
  end
end
