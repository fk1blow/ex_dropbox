defmodule ExDropbox.Api.Base do
  @moduledoc """
    Base module that acts as a mediator for the api resources
  """

  def get(endpoint, params \\ %{}) do
    ExDropbox.Configuration.get[:access_token]
    |> validate_request
    |> handle_request(endpoint, params)
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

  defp handle_request(token, endpoint, params) do
    headers = %{"Authorization" => "Bearer #{token}", "list" => "false"}
    url = endpoint <> request_params(params)
    HTTPoison.get(url, headers)
  end

  @moduledoc """
    handle response from httpoison call
    TODO: make shure you cover every response type dropbox may return
  """

  defp handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    {:ok, body}
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 400, body: body}}) do
    {:error, body}
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 404}}) do
    {:error, "resource not found"}
  end

  defp handle_response({:error, %HTTPoison.Error{reason: reason}}) do
    {:error, "connection refused"}
  end

  defp handle_response({:error, reason}), do: {:error, reason}

  @moduledoc """
    url utils
  """

  defp request_params(params) do
    no_ampersand = fn str -> String.slice(str, 0, String.length(str) - 1) end
    to_url_params = fn (x, acc) -> "#{acc}#{elem x, 0}=#{elem x, 1}&" end

    Dict.to_list(params)
    |> List.foldl("?", &(to_url_params.(&1, &2)))
    |> no_ampersand.()
  end
end
