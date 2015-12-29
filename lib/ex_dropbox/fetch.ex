defmodule ExDropbox.Fetch do
  def get(endpoint, headers, url_params) do
    IO.puts "Request.get: " <> endpoint <> inspect(headers) <> inspect(url_params)
  end

  def post(url, headers) do
    IO.puts "Request.post: " <> url <> " and headers: " <> inspect(headers)
  end
end
