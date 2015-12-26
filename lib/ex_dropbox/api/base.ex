defmodule ExDropbox.Api.Base do
  def get(url, headers \\ %{}) do
    HTTPoison.get(url, headers) |> handle_response
  end

  # do not add the auth access token in here
  defp handle_request({:error, reason}, _, _), do: {:error, reason}

  defp handle_request(token, endpoint, params) do
    headers = %{"Authorization" => "Bearer #{token}"}
    HTTPoison.get(endpoint <> request_params(params), headers)
  end

  @doc """
    handle response from httpoison call
    TODO: make shure you cover every response type dropbox may return
  """

  defp handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body, headers: headers}}) do
    {:ok, %ExDropbox.Model.Response{content: body, meta: headers}}
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 400, body: body, headers: headers}}) do
    {:error, %ExDropbox.Model.Response{content: body, meta: headers}}
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 404}}) do
    {:error, %ExDropbox.Model.Response{content: "resource not found"}}
  end

  defp handle_response({:error, %HTTPoison.Error{reason: reason}}) do
    {:error, %ExDropbox.Model.Response{content: "connection refused"}}
  end
end
