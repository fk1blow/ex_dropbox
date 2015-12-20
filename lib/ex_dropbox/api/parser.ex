defmodule ExDropbox.Api.Parser do
  @doc """
    transform a string to a map then picks a specific set of fields
  """
  def to_map({:ok, string}, picked_fields) do
    case Poison.decode string do
      {:ok, result} -> result |> Dict.take picked_fields
      {:error, reason} -> {:error, reason}
    end
  end

  def to_map({:error, string}, picked_fields), do: {:error, string}

  @doc """
    transform a string to a map
  """
  def to_map({:ok, string}) do
    case Poison.decode string do
      {:ok, result} -> result
      {:error, reason} -> {:error, reason}
    end
  end

  def to_map({:error, string}), do: {:error, string}
end
