defmodule ExDropbox.Api.Parser do
  @doc """
    to_map when the resource wants to specify extraction of specific fields
  """
  def to_map({:ok, string}, fields) do
    case Poison.decode string do
      {:ok, resource} -> resource |> Dict.take fields
      {:error, reason} -> {:error, reason}
    end
  end

  def to_map({:error, string}, fields) do
    {:error, string}
  end

  @doc """
    to_map for cases when a resource doesn't need specific fields
  """
  def to_map({:ok, string}) do
    case Poison.decode string do
      {:ok, resource} -> resource
      {:error, reason} -> {:error, reason}
    end
  end

  def to_map({:error, string}) do
    {:error, string}
  end
end
