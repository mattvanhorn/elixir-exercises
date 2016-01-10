defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      except every year that is evenly divisible by 400.
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    leapish?(year) && (non_century?(year) || leap_century?(year))
  end

  defp non_century?(year) do
    rem(year, 100) != 0
  end

  defp leapish?(year) do
    rem(year, 4) == 0
  end

  defp leap_century?(year) do
    rem(year, 400) == 0
  end

end
