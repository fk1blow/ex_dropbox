defmodule ExDropbox.OldResource do
  @moduledoc """
    It imports every module needed by a resource and adds
    a set of utility functions that will process a resource response
  """

  defmacro __using__(_opts) do
    quote do
      import ExDropbox.Api.Base
      import ExDropbox.Api.Endpoints

      @doc """
        to_map when the resource wants to specify extraction of specific fields
      """
      def to_map({:ok, resource_string}, resource_fields) do
        case Poison.decode resource_string do
          {:ok, resource} -> resource |> Dict.take resource_fields
          {:error, reason} -> {:error, reason}
        end
      end

      def to_map({:error, resource_string}, resource_fields) do
        {:error, resource_string}
      end

      @doc """
        to_map for cases when a resource doesn't need specific fields
      """
      def to_map({:ok, resource_string}) do
        case Poison.decode resource_string do
          {:ok, resource} -> resource
          {:error, reason} -> {:error, reason}
        end
      end

      def to_map({:error, resource_string}) do
        {:error, resource_string}
      end
    end
  end
end
