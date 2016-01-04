defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    validate_strand(strand)
    validate_nucleotide(nucleotide)
    strand
      |> Enum.filter(fn (n) -> n == nucleotide; end)
      |> Enum.count
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: Dict.t
  def histogram(strand) do
    validate_strand(strand)
    Enum.reduce(strand, initialized_histogram, fn(n, hist) ->  Dict.put(hist, n, hist[n] + 1) end)
  end

  defp initialized_histogram do
    @nucleotides |> Enum.reduce(%{}, fn(n, acc) -> Dict.put(acc, n, 0) end)
  end

  defp validate_strand(strand) do
    unless Regex.match?(~r/^[ATCG]*$/, to_string(strand)) do
      raise ArgumentError, message: "invalid strand - must contain only A,T,C, or G"
    end
  end

  defp validate_nucleotide(nucleotide) do
    unless  Enum.member?(@nucleotides, nucleotide)  do
      raise ArgumentError, message: "invalid nucleotide - must be one of: A,T,C, or G"
    end
  end
end
