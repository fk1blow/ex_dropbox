defmodule ExDropbox.Request do
  defstruct endpoint: nil, path: nil, params: nil, headers: %{}

  def base_url(request \\ %{}, endpoint) do
    %ExDropbox.Request{endpoint: endpoint}
  end

  def path(request, path) do
    %ExDropbox.Request{request | path: path}
  end

  def params(request, params) do
    %ExDropbox.Request{request | params: params_to_string(params)}
  end

  def authorization(request, auth) when is_bitstring(auth) do
    %ExDropbox.Request{request | headers: %{"Authorization" => "Bearer #{auth}"}}
  end

  def authorization(request, auth), do: request

  def perform_with(request, callback) do
    callback.(request.endpoint <> request.path <> request.params, request.headers)
  end

  defp params_to_string(params) do
    no_ampersand = fn str -> String.slice(str, 0, String.length(str) - 1) end
    to_url_params = fn (x, acc) -> "#{acc}#{elem x, 0}=#{elem x, 1}&" end
    Dict.to_list(params)
    |> List.foldl("?", &(to_url_params.(&1, &2)))
    |> no_ampersand.()
  end
end
