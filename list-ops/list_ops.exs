defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    reduce(l, 0, fn(_item, acc) -> acc + 1 end)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reduce(l, [], fn(item, acc) -> [item|acc] end)
  end

  @spec map(list, (any -> any)) :: list
  def map(l, func) do
    reverse(reduce(l, [], fn(item,acc) -> [func.(item)|acc] end))
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, func) do
    reverse(reduce(l, [], fn(item,acc) -> (func.(item) && [item|acc]) || acc end))
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([h|t], acc, f) do
    reduce(t, f.(h, acc), f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    reduce(reverse(a), b, fn(item,acc) -> [item|acc] end)
  end

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([h|t]), do: append(h, concat(t))
end
