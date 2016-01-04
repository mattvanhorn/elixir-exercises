defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence |> break_into_words |> count_occurrences
  end
  
  defp normalize(str) do
    str |> String.downcase() |> String.replace(~r/([^\w-]|_)+/u, " ")
  end

  defp break_into_words(str) do
    str |> normalize |> String.strip |> String.split(~r/\s+/u)
  end

  defp count_occurrences(arr) do
    Enum.reduce(arr, %{}, fn(x, acc) -> Dict.update(acc, x, 1, fn(val) -> val + 1 end) end)
  end
end
