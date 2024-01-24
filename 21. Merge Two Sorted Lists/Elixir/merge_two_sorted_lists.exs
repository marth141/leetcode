# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end

defmodule Solution do
  @spec merge_two_lists(list1 :: ListNode.t | nil, list2 :: ListNode.t | nil) :: ListNode.t | nil
  def merge_two_lists(list1, list2) do
    list1 = unlink_linked_list([], list1)
    list2 = unlink_linked_list([], list2)

    Enum.sort(list1 ++ list2)
    |> make_linked_list()
  end

  defp make_linked_list([]) do
    nil
  end

  defp make_linked_list([value | []]) do
    %ListNode{val: value, next: nil}
  end

  defp make_linked_list([value | next]) do
    %ListNode{val: value, next: make_linked_list(next)}
  end

  defp unlink_linked_list(acc, nil) do
    acc
  end

  defp unlink_linked_list(acc, %ListNode{val: value, next: nil}) do
    [value | acc]
  end

  defp unlink_linked_list(acc, %ListNode{val: value, next: next}) do
    unlink_linked_list([value | acc], next)
  end
end
