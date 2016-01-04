defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates |>
    Enum.reject(&same_as(base).(&1)) |>
    Enum.filter(&anagram_of(base).(&1))
  end

  defp same_as(base) do
    original = String.downcase(base)
    fn (candidate) -> String.downcase(candidate) == original end
  end

  defp anagram_of(base) do
    normalized_base = normalized_string(base)
    fn (candidate) -> normalized_string(candidate) == normalized_base end
  end

  defp normalized_string(str) do
    str |>
    String.downcase() |>
    String.to_char_list() |>
    Enum.sort |>
    List.to_string
  end
end
