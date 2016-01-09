defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(Dict.t, String.t, pos_integer) :: Dict.t
  def add(db, name, grade) do
    Dict.put(db, grade, _grade(db, grade) ++ [name])
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(Dict.t, pos_integer) :: [String]
  def grade(db, grade) do
    _grade(db, grade)
  end
  defp _grade(db, grade) do
    Dict.get(db, grade) || []
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(Dict) :: Dict.t
  def sort(db) do
    db
      |> Map.to_list()
      |> Enum.map(fn(tuple) -> {elem(tuple, 0), Enum.sort(elem(tuple, 1))} end)
      |> Enum.into(%{})
  end
end
