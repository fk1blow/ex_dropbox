defmodule ExDropbox.Parser do
  @doc """
    transform a string to a map then picks a specific set of fields
  """
  def parse_to({:ok, string}, model) do
    case Poison.decode(string, keys: :atoms) do
      {:ok, result} -> struct(model, result)
      {:error, reason} -> {:error, reason}
    end
  end
  def parse_to({:error, string}, _), do: {:error, string}
end