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

  @moduledoc """
    request validations - basically, checks for access_token validity
  """

  defp validate_request(token) when is_bitstring(token), do: token

  defp validate_request(nil), do: {:error, "invalid access token"}

  defp validate_request(_), do: {:error, "invalid access token"}

  @moduledoc """
    handles request for depending on the validation - makes the httpoison request
  """

  defp handle_request({:error, reason}, _, _), do: {:error, reason}

  defp handle_request(token, api_host, api_resource) do
    headers = %{"Authorization" => "Bearer #{token}"}
    url = api_host <> api_resource
    HTTPoison.get(url, headers)
  end

  @moduledoc """
    handle response from httpoison call
  """

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
