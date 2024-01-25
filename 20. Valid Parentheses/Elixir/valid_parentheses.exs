defmodule Solution do
  @valid_pairs [{"(", ")"}, {"[", "]"}, {"{", "}"}]

  @spec is_valid(s :: String.t) :: boolean
  def is_valid(s) do
    String.graphemes(s)
    |> stack_check([])
  end

  def stack_check([head | tail], open_stack) when head == "(" do
    open_stack = [head | open_stack]
    stack_check(tail, open_stack)
  end

  def stack_check([head | tail], open_stack) when head == "[" do
    open_stack = [head | open_stack]
    stack_check(tail, open_stack)
  end

  def stack_check([head | tail], open_stack) when head == "{" do
    open_stack = [head | open_stack]
    stack_check(tail, open_stack)
  end

  def stack_check([head | tail], open_stack) when head == ")" do
    first_parentheses = List.first(open_stack)
    with true <- is_pair(first_parentheses, head) do
        open_stack = open_stack -- [first_parentheses]
        stack_check(tail, open_stack)
    end
  end

  def stack_check([head | tail], open_stack) when head == "]" do
    first_parentheses = List.first(open_stack)
    with true <- is_pair(first_parentheses, head) do
        open_stack = open_stack -- [first_parentheses]
        stack_check(tail, open_stack)
    end
  end

  def stack_check([head | tail], open_stack) when head == "}" do
    first_parentheses = List.first(open_stack)
    with true <- is_pair(first_parentheses, head) do
        open_stack = open_stack -- [first_parentheses]
        stack_check(tail, open_stack)
    end
  end

  def stack_check([], []) do
    true
  end

  def stack_check([], _) do
    false
  end

  def stack_check(_, _) do
    false
  end

  def is_pair(left, right) do
    Enum.member?(@valid_pairs, {left, right})
  end
end
