defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b        -> :equal
      sublist?(b, a) -> :sublist
      sublist?(a, b) -> :superlist
      true           -> :unequal
    end
  end

  defp sublist?(_, []), do: true
  defp sublist?([], _), do: false
  defp sublist?(haystack, needle) when length(needle) > length(haystack), do: false
  defp sublist?(haystack=[_|haystack_tail], needle) do
    starts_with?(haystack, needle) ||  sublist?(haystack_tail, needle)
  end

  defp starts_with?(_, []), do: true
  defp starts_with?([same|haystack_tail], [same|needle_tail]) do
    starts_with?(haystack_tail, needle_tail)
  end
  defp starts_with?(_, _), do: false

end
