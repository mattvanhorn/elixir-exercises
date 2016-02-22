defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / year_on(planet)
  end

  def year_on(:earth)    do 60 * 60 * 24 * 365.25 end
  def year_on(:mercury)  do 0.2408467  * year_on(:earth) end
  def year_on(:venus)    do 0.61519726 * year_on(:earth) end
  def year_on(:mars)     do 1.8808158  * year_on(:earth) end
  def year_on(:jupiter)  do 11.862615  * year_on(:earth) end
  def year_on(:saturn)   do 29.447498  * year_on(:earth) end
  def year_on(:uranus)   do 84.016846  * year_on(:earth) end
  def year_on(:neptune)  do 164.79132  * year_on(:earth) end
end
