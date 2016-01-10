defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Dict.t) :: map()
  def transform(input) do
    input
      |> Dict.to_list
      |> Enum.reduce(%{}, fn(entry, out) -> out |> Dict.merge(entry |> invert |> normalize) end)
  end

  defp invert(tuple) do
    { value, keys } = { elem(tuple, 0), elem(tuple, 1) }
    keys |> Enum.map(fn(key) -> { key, value } end)
  end

  defp normalize(dict) do
    Enum.map(dict, fn({ key, val }) -> { String.downcase(key), val } end)
  end

end
