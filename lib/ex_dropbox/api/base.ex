defmodule ExDropbox.Api.Base do
  @moduledoc """
    Base module that acts as a mediator for the api resources
  """
  import ExDropbox.Api.Endpoints

  def get(api_host, api_resource) do
    ExDropbox.Configuration.get[:access_token]
    |> validate_request
    |> make_request(api_host, api_resource)
  end

  defp validate_request(access_token) do
    case access_token do
      token when is_bitstring(token) -> token
      nil -> {:error, "invalid or undefined access token"}
      _ -> {:error, "invalid access token"}
    end
  end

  defp make_request({:error, reason}, _, _), do: {:error, reason}

  defp make_request(token, api_host, api_resource) do
    headers = %{"Authorization" => "Bearer #{token}"}
    url = api_host <> api_resource

    case HTTPoison.get(url, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "resource not found"}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, "connection refused"}
    end
  end
end
