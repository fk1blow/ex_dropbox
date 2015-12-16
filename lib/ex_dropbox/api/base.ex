defmodule ExDropbox.Api.Base do
  import ExDropbox.Api.Endpoints
  alias ExDropbox.Configuration, as: Config

  @moduledoc """
    Base module that acts as a mediator for the api resources
  """

  def get(api_host, api_resource) do
    Config.get[:access_token]
    |> validate_request
    |> make_request(api_host, api_resource)
  end

  defp validate_request(access_token) do
    token_length = String.length(access_token)
    case access_token do
      token when token_length > 1 -> token
      nil -> {:error, "invalid or undefined access token"}
      _ -> {:error, "invalid access token"}
    end
  end

  defp make_request({:error, reason}, _, _), do: {:error, reason}

  defp make_request(token, api_host, api_resource) do
    {:ok, "should perform request"}
    # case HTTPoison.get(url, headers) do
    #   {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
    #     IO.puts body
    #   {:ok, %HTTPoison.Response{status_code: 404}} ->
    #     IO.puts "Not found :("
    #   {:error, %HTTPoison.Error{reason: reason}} ->
    #     IO.inspect "reason is: #{reason}"
    # end
  end
end
