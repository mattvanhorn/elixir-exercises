defmodule Bob do
  def hey(input) do
    cond do
        silent?(input) -> "Fine. Be that way!"
        shouting?(input) -> "Whoa, chill out!"
        asking?(input) -> "Sure."
        true -> "Whatever."

    end
  end

  defp silent?(input) do
    String.strip(input) == ""
  end

  defp shouting?(input) do
    has_words?(input) && input == String.upcase(input)
  end

  defp asking?(input) do
    String.ends_with? input, "?"
  end

  defp has_words?(input) do
    !String.match?(input, ~r/\A[0-9\W]+\z/)
  end
end
