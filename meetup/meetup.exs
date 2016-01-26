defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, :teenth) do
    select_weekdays(year, month, weekday)
      |> Enum.find(fn({year, month, day}) -> Enum.member?(13..19, day) end)
  end

  def meetup(year, month, weekday, :first) do
    select_weekdays(year, month, weekday) |> List.first()
  end

  def meetup(year, month, weekday, :second) do
    select_weekdays(year, month, weekday) |> Enum.at(1)
  end

  def meetup(year, month, weekday, :third) do
    select_weekdays(year, month, weekday) |> Enum.at(2)
  end

  def meetup(year, month, weekday, :fourth) do
    select_weekdays(year, month, weekday) |> Enum.at(3)
  end

  def meetup(year, month, weekday, :last) do
    select_weekdays(year, month, weekday) |> List.last()
  end

  defp select_weekdays(year, month, weekday) do
    1..:calendar.last_day_of_the_month(year, month)
      |> Enum.filter(fn(day) -> is_weekday?({year, month, day}, weekday) end)
      |> Enum.map(fn(day) -> {year, month, day} end)
  end

  defp is_weekday?(date, weekday) do
    :calendar.day_of_the_week(date) == weekday_number(weekday)
  end

  defp weekday_number(weekday) do
    case weekday do
      :monday     -> 1
      :tuesday    -> 2
      :wednesday  -> 3
      :thursday   -> 4
      :friday     -> 5
      :saturday   -> 6
      :sunday     -> 7
    end
  end
end
