defmodule ExDropbox.Api.Base do
  @moduledoc """
    Base module that acts as a mediator for the api resources
  """

  def get(api_host, api_resource) do
    ExDropbox.Configuration.get[:access_token]
    |> validate_request
    |> handle_request(api_host, api_resource)
    |> handle_response
  end

  defp validate_request(access_token) do
    case access_token do
      token when is_bitstring(token) -> token
      nil -> {:error, "invalid or undefined access token"}
      _ -> {:error, "invalid access token"}
    end
  end

  defp handle_request({:error, reason}, _, _), do: {:error, reason}

  defp handle_request(token, api_host, api_resource) do
    headers = %{"Authorization" => "Bearer #{token}"}
    url = api_host <> api_resource
    HTTPoison.get(url, headers)
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    {:ok, body}
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 404}}) do
    {:error, "resource not found"}
  end

  defp handle_response({:error, %HTTPoison.Error{reason: reason}}) do
    {:error, "connection refused"}
  end
end
